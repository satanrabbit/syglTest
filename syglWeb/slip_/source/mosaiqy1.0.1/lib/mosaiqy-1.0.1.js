/**
 * @fileOverview Mosaiqy for jQuery
 * @version 1.0.1
 * @author Fabrizio Calderan, http://www.fabriziocalderan.it/mosaiqy
 *
 * Released under license Creative Commons, Attribution-NoDerivs 3.0
 * (CC BY-ND 3.0) available at http://creativecommons.org/licenses/by-nd/3.0/
 * Read the license carefully before using this plugin.
 *
 * Docs generation: java -jar jsrun.jar app/run.js -a -p -t=templates/couchjs ../lib/<libname>.js
 */

(function($) {

    "use strict";

    var
    /**
     * This function enable logging where available on dev version.
     * If console object is undefined then log messages fail silently
     * @function
     */
    appDebug = function() {
        var args = Array.prototype.slice.call(arguments),
            func = args[0];
        if (typeof console !== 'undefined') {
            if (typeof console[func] === 'function') {
                console[func].apply(console, args.slice(1));
            } 
        }
    },
    
    /**
     * @function
     * @param { String } ua     Current user agent specific string
     * @param { String } prop   The property we want to check
     * 
     * @returns { Object }
     * <pre>
     *      isEnabled       : True if acceleration is available, false otherwise;
     *      transitionEnd   : Event available on current browser;
     *      duration        : Vendor specific CSS property.
     * </pre>
     * 
     * @description
     * Detect if GPU acceleration is enabled for transitions.
     * code gist mantained at https://gist.github.com/892739
     */
    GPUAcceleration = (function(ua, prop) {
    
        var div     = document.createElement('div'),
            cssProp = function(p) {
                return p.replace(/([A-Z])/g, function(match, upper) {
                    return "-" + upper.toLowerCase();
                });
            },
            vendorProp,
            uaList  = {
                msie    : 'MsTransition',
                opera   : 'OTransition',
                mozilla : 'MozTransition',
                webkit  : 'WebkitTransition'
            };
            
        for (var b in uaList) {
            if (uaList.hasOwnProperty(b)) {
                if (ua[b]) { vendorProp = uaList[b]; }
            }
        }
                
        return {
            isEnabled       : (function(s) {
                return !!(s[prop] || vendorProp in s  || (ua.opera && parseFloat(ua.version) > 10.49));
            }(div.style)),
            transitionEnd   : (function() {
                return (ua.opera)
                    ? 'oTransitionEnd'
                    : (ua.webkit)? 'webkitTransitionEnd' : 'transitionend';
            }()),
            duration        : cssProp(vendorProp) + '-duration'
        };
    }($.browser, 'transition')),
    
    
    /**
     * @function
     * @description
     * This algorithm is described in http://en.wikipedia.org/wiki/Knuth_shuffle
     * The main purpose is to ensure an equally-distributed animation sequence, so
     * every entry point can have the same probability to be chosen without
     * duplicates.
     *
     * @returns { Array } A shuffled array of entry points.
     */
    shuffledFisherYates = function(len) {
        var i, j, tmp_i, tmp_j, shuffled = [];
        
        i = len;
        for (j = 0; j < i; j++) { shuffled[j] = j; }
        while (--i) {
            /*
             * [~~] is the bitwise op quickest equivalent to Math.floor()
             * http://jsperf.com/bitwise-not-not-vs-math-floor
             */
            j           = ~~(Math.random() * (i+1));
            tmp_i       = shuffled[i];
            tmp_j       = shuffled[j];
            shuffled[i] = tmp_j;
            shuffled[j] = tmp_i;
        }
            
        return shuffled;
    },
    
     /**
     * @class
     * @final
     * @name Mosaiqy
     * @returns public methods of Mosaiqy object for its instances.
     */
    Mosaiqy = function($) {
        
        
        var _s = {
            animationDelay      : 3000,
            animationSpeed      : 800,
            avoidDuplicates     : false,
            cols                : 2,
            fadeSpeed           : 750,
            indexData           : 0,
            loadTimeout         : 7500,
            loop                : true,
            onCloseZoom         : null,
            onOpenZoom          : null,
            openZoom            : true,
            rows                : 2,
            scrollZoom          : true,
            template            : ''
            
        },
        
        _cnt, _ul, _li, _img,
        
        _points             = [],
        _entryPoints        = [],
        _tplCache           = {},
        _animationPaused    = false,
        _animationRunning   = false,
        _thumbSize          = {},
        _page               = ($.browser.opera)? $("html") : $("html,body"),
        _intvAnimation,
            
            
            
        /**
         * @private
         * @name Mosaiqy#_createTemplate
         * @param { Number } index The index of JSON data array
         * @description
         * 
         * The method merges the user-defined template with JSON data associated
         * for a given index and it's called both at initialization and at every
         * animation loop.
         * 
         * @returns { jQuery } HTML Nodes to inject into the document
         */
        _createTemplate = function(index) {
            var tpl = '';
            if (typeof _tplCache[index] === 'undefined') {
                _tplCache[index] = _s.template.replace(/\$\{([^\}]+)\}/gm, function(data, key) {
                    
                    /**
                     * if key has one or more dot then a nested key has been requested
                     * and a while loop goes in-depth over the JSON
                     */
                    var value = (function() {
                        var par = key.split('.'), len = 0, val;
                        if (par.length) {
                            val = _s.data[index];
                            par = par.reverse();
                            len = par.length;
                                
                            while (len--) {  val = val[par[len]] || { }; }
                            return (typeof val === "string")? val : '';
                        }
                        return _s.data[index][key];
                    }());
                    
                    if (typeof value === 'undefined') {
                        return key;
                    }
                    return value;
                });
            }
            
            tpl = _tplCache[index];
            if (typeof window.innerShiv === 'function') {
                tpl = window.innerShiv(tpl, false);
            }
            
            return $(tpl);
        },
            
            
            
        /**
         * @private
         * @name Mosaiqy#_setInitialImageCoords
         * @description
         * 
         * Sets initial offset (x and y position) of each list items and the width
         * and min-height of the container. It doesn't set the height property
         * so the wrapper can strecth when a zoom image has been requested or closed.
         */
        _setInitialImageCoords  = function() {
            var li  = _li.eq(0);
            
            _thumbSize   = { w : li.outerWidth(true), h : li.outerHeight(true) };
            /**
             * defining li X,Y offset
             * [~~] is the bitwise op quickest equivalent to Math.floor()
             * http://jsperf.com/bitwise-not-not-vs-math-floor
             */
            _li.each(function(i, el) {
                $(el).css({
                    top     : _thumbSize.h * (~~(i/_s.cols)),
                    left    : _thumbSize.w * (i%_s.cols)
                });
            });
            
            /* defining container size */
            _ul.css({
                minHeight   : _thumbSize.h * _s.rows,
                width       : _thumbSize.w * _s.cols
            });
            _cnt.css({
                minHeight   : _thumbSize.h * _s.rows,
                width       : _thumbSize.w * _s.cols
            });
        },
    
        /**
         * @private
         * @name Mosaiqy#_getPoints
         * @description
         * 
         * _getPoints object stores 4 information
         * <ol>
         *   <li>The direction of movement (css property)</li>
         *   <li>The selection of nodes to move (i.e in a 3x4 grid, point 4 and 5 have
         *      to move images 2,6,10)</li>
         *   <li>The position in which we want to inject-before the new element (except
         *      for the last element which needs to be injected after)</li>
         *   <li>The position (top and left properties) of entry tile</li>
         * </ol>
         * 
         * <code><pre>
         *    [0,8,1,9,2,10,3,11, 0,4,4,8,8,12*]    * = append after
         *    
         *        0   2   4   6
         *    8 |_0_|_1_|_2_|_3_| 9
         *   10 |_4_|_5_|_6_|_7_| 11
         *   12 |_8_|_9_|_10|_11| 13    
         *        1   3   5   7
         * </pre></code>
         * 
         * <p>
         * In earlier versions of this algorithm, the order of nodes was counterclockwise
         * (tlbr) and then alternating (tblr). Now this enumeration pattern (alternating
         * tb and lr) performs a couple of improvements on code logic and on readability:
         * </p>
         *
         * <ol>
         *   <li>Given an even-indexed node, the next adjacent index has the same selector:<br />
         *      e.g. points[8] = li:nth-child(n+1):nth-child(-n+4) [0123]<br />
         *           points[9] = li:nth-child(n+1):nth-child(-n+4) [0123]<br />
         *      (it's easier to retrieve this information)</li>
         *   <li>If a random point is even (i & 1 === 0) then the 'direction' property of node
         *      selection is going to be increased during slide animation. Otherwise is going
         *      to be decreased and then we remove first or last element (if random number is 9,
         *      then the collection has to be [3210] and not [0123], since we always remove the
         *      disappeared node when the animation has completed.)</li>
         * </ol>
         *
         * @example
         *    Another Example (4x2)
         *    [0,6,1,7, 0,2,2,4,4,6,6,8*]   * = append after
         *
         *        0   2
         *    4 |_0_|_1_| 5
         *    6 |_2_|_3_| 7
         *    8 |_4_|_5_| 9
         *   10 |_6_|_7_| 11
         *        1   3
         */
        _getPoints = function() {
            
            var c, n, s, /* internal counters */
                selectors = {
                    col : "li:nth-child($0n+$1)",
                    row : "li:nth-child(n+$0):nth-child(-n+$1)"
                };
            
            /* cols information */
            for (n = 0; n < _s.cols; n = n + 1) {
                
                s = selectors.col.replace(/\$(\d)/g, function(selector, i) {
                    return [_s.cols, n + 1][i]; });
                    
                _points.push({ prop: 'top', selector : s, node : n,
                    position : {
                        top     : -(_thumbSize.h),
                        left    : _thumbSize.w * n
                    }
                });
                _points.push({ prop: 'top', selector : s, node : _s.cols * (_s.rows - 1) + n,
                    position : {
                        top     : _thumbSize.h * _s.rows,
                        left    : _thumbSize.w * n
                    }
                });
            }
                
            /* rows information */
            for (c = 0, n = 0; n < _s.rows; n = n + 1) {
                
                s = selectors.row.replace(/\$(\d)/g, function(selector, i) {
                    return [c + 1, c + _s.cols][i]; });
                    
                _points.push({ prop: 'left', selector : s, node : c,
                    position : {
                        top     : _thumbSize.h * n,
                        left    : -(_thumbSize.w)
                    }
                });
                _points.push({ prop: 'left', selector : s, node : c += _s.cols,
                    position : {
                        top     : _thumbSize.h * n,
                        left    : _thumbSize.w * _s.cols
                    }
                });
            }
                
            _points[_points.length - 1].node -= 1;
            appDebug("groupCollapsed", 'points information');
            appDebug(($.browser.mozilla)?"table":"dir", _points);
            appDebug("groupEnd");
        },
        
        
        
        /**
         * @private
         * @name Mosaiqy#_animateSelection
         * @return a deferred promise
         * @description
         *
         * This method runs the animation.
         */
        _animateSelection = function() {
            
            var rnd, tpl, referral, node, animatedSelection, isEven,
                dfd = $.Deferred();
                
            appDebug("groupCollapsed", 'call animate()');
            appDebug("info", 'Dataindex is', _s.indexData);
                
                
            /**
             * Get the entry point from shuffled array
             */ 
            rnd = _entryPoints.pop();
            isEven = ((rnd & 1) === 0);
            
            animatedSelection = _cnt.find(_points[rnd].selector);
            /**
             * append new «li» element
             * if the random entry point is the last one then we append the
             * new node after the last «li», otherwise we place it before.
             */
            referral    = _li.eq(_points[rnd].node);
            node        = (rnd < _points.length - 1)?
                  $('<li />').insertBefore(referral)
                : $('<li />').insertAfter(referral);
                
            node.data('mosaiqy-index', _s.indexData);
                
                
            /**
             * Generate template to append with user data
             */
            tpl = _createTemplate(_s.indexData);
            tpl.appendTo(node.css(_points[rnd].position));
                
            appDebug("info", "Random position is %d and its referral is node", rnd, referral);
                
            /**
             * Looking for images inside template fragment, wait the deferred
             * execution and checking a promise status.
             */
            $.when(node.find('img').mosaiqyImagesLoad(_s.loadTimeout))
            /**
             * No image/s can be loaded, remove the node inserted, then call
             * again the _animate method
             */
            .fail(function() {
                appDebug("warn", 'Skip dataindex %d, call _animate()', _s.indexData);
                appDebug("groupEnd");
                node.remove();
                dfd.reject();
            })
            /**
             * Image/s inside template fragment have been successfully loaded so
             * we can apply the slide transition on the selected nodes and the
             * added node
             */ 
            .done(function() {
                var prop            = _points[rnd].prop,
                    amount          = (prop === 'left')? _thumbSize.w : _thumbSize.h,
                    /**
                     * @ignore
                     * add new node into animatedNodes collection and change
                     * previous collection
                     */
                    animatedNodes   = animatedSelection.add(node),
                    animatedQueue   = animatedNodes.length,
                    move = {};
                
                move[prop] = '+=' + (isEven? amount : -amount) + 'px';
                appDebug("log", 'Animated Nodes:', animatedNodes);
                
                /**
                 * $.animate() function has been extended to support css transition
                 * on modern browser. For this reason I cannot use deferred animation,
                 * because if GPUacceleration is enabled the code will not use native
                 * animation.
                 *
                 * See code below
                 */
                animatedNodes.animate(move , _s.animationSpeed,
                    function() {
                        var len;
                            
                        if (--animatedQueue) { return; }
                            
                        /**
                         * Opposite node removal. "Opposite" is related on sliding direction
                         * e.g. on 2->[159] (down) opposite has index 9
                         *      on 3->[159] (up) opposite has index 1
                         */
                        if (isEven) {
                            animatedSelection.last().remove();
                        }
                        else {
                            animatedSelection.first().remove();
                        }
                            
                        appDebug("log", 'Animated Selection:', animatedSelection);
                        animatedSelection = (isEven) 
                            ? animatedSelection.slice(0, animatedSelection.length - 1)
                            : animatedSelection.slice(1, animatedSelection.length);
                            
                        appDebug("log", 'Animated Selection:', animatedSelection);
                            
                        /**
                         * <p>Node rearrangement when animation affects a column. In this case
                         * a shift must change order inside «li» collection, otherwise the 
                         * subsequent node selection won't be properly calculated.
                         * Algorithm is quite simple:</p>
                         *
                         * <ol>
                         *   <li>The offset displacement of shifted nodes is always
                         *       determined by the number of columns except when shift direction is
                         *       bottom-up: in fact the last node of animatedSelection collection
                         *       represents an exception because its position is affected by the
                         *       presence of the new node (placed just before it);</li>
                         *   <li>offset is negative on odd entry point (down and right) and
                         *       positive otherwise (top and left);</li>
                         *   <li>at each iteration we retrieve the current «li» nodes in the
                         *       grid so we can work with actual node position.</li>
                         * </ol>
                         * 
                         * <p>If the animation affected a row, rearrangement of nodes is not needed
                         * at all because insertion is sequential, thus the new node and shifted
                         * nodes already have the right index.</p>
                         */
                        if (prop === 'top') {
                            len = animatedSelection.length;
                            
                            animatedSelection.each(function(i) {
                                var node, curpos, offset, newpos;
                                
                                /**
                                 * @ignore
                                 * Retrieve node after each new insertion and rearrangement
                                 * of selected animating nodes 
                                 */ 
                                _li     = _cnt.find("li:not(.mosaiqy-zoom)");
                                
                                node    = $(this);
                                curpos  = _li.index(node);
                                offset  = (isEven) ? _s.cols : -(_s.cols - ((1 === len - i)? 0 : 1));
                                        
                                if (!!offset) { 
                                    newpos  = curpos + offset;
                                    if (newpos < _li.length) {
                                        node.insertBefore(_li.eq(newpos));
                                    }
                                    else {
                                        node.appendTo(_ul);
                                    }
                                }
                            
                            });
                        }
                        appDebug("groupEnd");
                        dfd.resolve();
                    }
                );
            });
            
            return dfd.promise();
        },
            
            
            
        /**
         * @private
         * @name Mosaiqy#_animationCycle
         * @description
         * 
         * <p>The method runs the animation and check some private variables to
         * allow cycle and animation execution. Every time the animation has
         * completed successfully, the JSON index and node collection are updated.</p>
         * 
         * <p>Animation interval is not executed on mouse enter (_animationPaused)
         * or when animation is still running.</p>
         */ 
        _animationCycle = function() {
            if (!_animationPaused && !_animationRunning) {
                
                _animationRunning = true;
                
                if (_entryPoints.length === 0) {
                    _entryPoints = shuffledFisherYates(_points.length);
                    appDebug("info", 'New entry point shuffled array', _entryPoints);
                }
                
                appDebug("info", 'Animate selection');
                _incrementIndexData();
                
                $.when(_animateSelection())
                    /**
                     * In all cases dataIndex is increased and the animationRunning
                     * state is set to false so animation could continue.
                     */
                    .then(function() {
                        _s.indexData = _s.indexData + 1;
                        _animationRunning = false;
                        appDebug("info", 'End animate selection');
                    })
                    /**
                     * If a thumbnail was not loaded within the defined limit then animation
                     * should not wait another delay. We call soon the method again.
                     */
                    .fail(function() {
                        _animationCycle();                        
                    })
                    /**
                     * Thumbnail was loaded. Update the reference of list-items (changed)
                     * on stage and call the method again after timeout.
                     */
                    .done(function() {
                        _li = _ul.find('li:not(.mosaiqy-zoom)');
                        _intvAnimation = setTimeout(function() {
                            _animationCycle();
                        }, _s.animationDelay);
                    });
            }
            else {
                _intvAnimation = setTimeout(function() {
                    _animationCycle();
                }, _s.animationDelay * 2);
            }
        },
            
            
            
        /**
         * @private
         * @name Mosaiqy#_pauseAnimation
         * @description
         * 
         * Set private _animationPaused to true so the animation cycle can run
         * (unless a zoom is currently opened).
         */
        _pauseAnimation = function() {
            _animationPaused = true;
        },
            
            
            
        /**
         * @private
         * @name Mosaiqy#_playAnimation
         * @description
         * 
         * Set private _animationPaused to false so the animation cycle can stop.
         */
        _playAnimation = function() {
            _animationPaused = false;
        },
            
          
            
        /**
         * @private
         * @name Mosaiqy#_incrementIndexData
         * @description
         * 
         * <p>The main purpose is to correctly increment the indexData for the JSON
         * data retrieval. If user choosed "avoidDuplicate" option, then the method
         * checks if a requested image is already on stage. If so, a loop starts
         * looking for the first image not in stage, increasing the dataIndex.</p>
         */
        _incrementIndexData     = function() {
            
            var safe    = _s.data.length,
                stage   = [];
                
            if (_s.indexData === _s.data.length) {
                if (!_s.loop) {
                    return _pauseAnimation();
                }
                else {
                    _s.indexData = 0;
                }
            }
                
            if (_s.avoidDuplicates) {
                appDebug('info', "Avoid Duplicates");
                _li.each(function() {
                    var i = $(this).data('mosaiqy-index');
                    stage[i] = i;
                });
                appDebug('info', "Now on stage: ", stage);
                
                while (safe--) {
                    if (typeof stage[_s.indexData] !== 'undefined') {
                        appDebug('info', "%d already exist (skip)", _s.indexData)
                        _s.indexData = _s.indexData + 1;
                        if (_s.indexData === _s.data.length) {
                            if (!_s.loop) {
                                return _pauseAnimation();
                            }
                            else {
                                _s.indexData = 0;
                            }
                        }
                        continue;
                    }
                    appDebug('info', "%d not in stage (ok)", _s.indexData);
                    break;
                }
            }
        },
            
            
           
        /**
         * @private
         * @name Mosaiqy#_setNodeZoomEvent
         * @description
         * 
         * <p>This method manages the zoom main events by some scoped internal functions.</p>
         * 
         * <p><code>closeZoom</code> is called when user clicks on "Close" button over a zoom
         * image or when another thumbanail is choosed and another zoom is currently opened.
         * The function stops all running transitions (if any) and it closes the zoom container
         * while changing opacity of some elements (close button, image caption). At the end of
         * animation it removes some internal classes and the «li» node that contained the zoom.</p>
         *
         * <p>The function <code>closeZoom</code> returns a deferred promise object, so it can be
         * called in a synchronous code queue inside other functions, ensuring all operation have
         * been successfully completed.</p>
         *
         * <p><code>viewZoom</code> is called when the previous function <code>createZoom</code>
         * successfully created the zoom container into the DOM. The function creates the zoom image
         * and the closing button binding the click event. If image is not in cache the zoom is opened
         * with a slideDown effect with a waiting loader.</p>
         * 
         * <p><code>createZoom</code> calls the <code>closeZoom</code> function (if any zoom images
         * are currently opened) then creates the zoom container into the DOM and then scroll the page
         * until the upper bound of the thumbnail choosed has reached (unless scrollzoom option is set to
         * false). When scrolling effect has completed then <code>viewZoom</code> function is called.</p>
         */ 
        _setNodeZoomEvent   = function(node) {
                
            var nodezoom, $this, i, zoomRunning,
                zoomFigure, zoomCaption, zoomCloseBtt,
                pagePos, thumbPos, diffPos;
            
            function closeZoom() {
                var dfd = $.Deferred();
                
                if ((nodezoom || { }).length) {
                    appDebug("log", 'closing previous zoom');
                     
                    zoomCaption.stop(true)._animate({ opacity: '0' }, _s.fadeSpeed / 4);
                    zoomCloseBtt.stop(true)._animate({ opacity: '0' }, _s.fadeSpeed / 2);
                    _li.removeClass('zoom');
                    
                    $.when(nodezoom.stop(true)._animate({ height : '0' }, _s.fadeSpeed))
                        .then(function() {
                            nodezoom.remove();
                            nodezoom = null;
                            appDebug("log", 'zoom has been removed');
                            if (typeof _s.onCloseZoom === 'function') {
                                _s.onCloseZoom($this);
                            }
                            dfd.resolve();
                        });
                }
                else {
                    dfd.resolve();
                }
                return dfd.promise();
            }
            
            
            function viewZoom() {
                
                var zoomImage, imgDesc, zoomHeight;
                    
                appDebug("log", 'viewing zoom');
                    
                zoomFigure  = nodezoom.find('figure');
                zoomCaption = nodezoom.find('figcaption');
                    
                zoomImage = $('<img class="mosaiqy-zoom-image" />').attr({
                        src     : $this.find('a').attr('href')
                    });
                    
                zoomImage.appendTo(zoomFigure);
                
                if (zoomImage.get(0).height === 0) {
                    zoomImage.hide();
                }
                    
                zoomHeight = (!!zoomImage.get(0).complete)? zoomImage.height() : 200;
                nodezoom._animate({ height : zoomHeight + 'px' }, _s.fadeSpeed, function() {
                    if (typeof _s.onOpenZoom === 'function') {
                        _s.onOpenZoom($this);
                    }
                });
                    
                imgDesc = $this.find('img').prop('longDesc');
                if (!!imgDesc) {
                    zoomImage.wrap($('<a />').attr({
                        href    : imgDesc,
                        target  : "new"
                    }));
                }
                    
                /**
                 * Append Close Button
                 */
                zoomCloseBtt = $('<a class="mosaiqy-zoom-close">Close</a>').attr({
                    href    : "#"
                })
                .bind("click.mosaiqy", function(evt) {
                    $.when(closeZoom()).then(function() {
                        _cnt.removeClass('zoom');
                        zoomRunning = false;
                        _playAnimation();
                    });
                    evt.preventDefault();
                })
                .appendTo(zoomFigure);
                    
                    
                $.when(zoomImage.mosaiqyImagesLoad(
                    _s.loadTimeout,
                    function(img) {
                        setTimeout(function() {
                            var fadeZoom = (!!zoomImage.get(0).height)? _s.fadeSpeed : 0;
                                
                            img.fadeIn(fadeZoom, function() {
                                zoomCloseBtt._animate({ opacity: '1' }, _s.fadeSpeed / 2);
                                zoomCaption.html($this.find('figcaption').html())._animate({ opacity: '1' }, _s.fadeSpeed);
                            });
                        }, _s.fadeSpeed / 1.2);
                        
                    })
                )
                    .done(function() {
                        appDebug("log", 'zoom ready');
                        if (zoomHeight < zoomImage.height()) {
                            nodezoom._animate({ height : zoomImage.height() + 'px' }, _s.fadeSpeed);
                        }
                    })
                    .fail(function() {
                        appDebug("warn", 'cannot load ', $this.find('a').attr('href'));
                        zoomCloseBtt.trigger("click.mosaiqy");
                    });
            }
            
            
            function createZoom(previousClose) {
                
                appDebug("log", 'opening zoom');
                zoomRunning = true;
                
                $.when(previousClose())
                    .done(function() {
                        
                        var timeToScroll;
                        
                        _cnt.addClass('zoom');
                        $this.addClass('zoom');
                        _li = _cnt.find('li:not(.mosaiqy-zoom)');
                        
                        /**
                         * webkit bug: http://code.google.com/p/chromium/issues/detail?id=2891 
                         */                    
                        thumbPos    = $this.offset().top;
                        pagePos     = (document.body.scrollTop !== 0)
                            ? document.body.scrollTop
                            : document.documentElement.scrollTop;
                        
                        if (_s.scrollZoom) {
                            diffPos         = Math.abs(pagePos - thumbPos);
                            timeToScroll    = (diffPos > 0) ? ((diffPos * 1.5) + 400) : 0;
                        }
                        else {
                            thumbPos = pagePos;
                            timeToScroll = 0;
                        }
                        /**
                         * need to create the zoom node then append it and then open it. When using
                         * HTML5 elements we need the innerShiv function available.
                         */
                        nodezoom = '<li class="mosaiqy-zoom"><figure><figcaption></figcaption></figure></li>';
                        nodezoom = (typeof window.innerShiv === 'function')
                            ? $(innerShiv(nodezoom, false))
                            : $(nodezoom);
                        
                        if (i < _li.length) {
                            nodezoom.insertBefore(_li.eq(i));
                        }
                        else {
                            nodezoom.appendTo(_ul);
                        }
                               
                        $.when(_page.stop()._animate({ scrollTop: thumbPos }, timeToScroll))
                            .done(function() {
                                zoomRunning = false;
                                viewZoom();
                            });
                    });
            }
            
            /**
             * Set the click event handler on thumbnails («li» nodes). Since nodes are removed and
             * injected at every animation cycle, the live() method is needed.
             */
            node.live('click.mosaiqy', function(evt) {
                
                if (!_animationRunning && !zoomRunning) {
                    /**
                     * find the index of «li» selected, then retrieve the element placeholder
                     * to append the zoom node.
                     */
                    _pauseAnimation();
                    
                    $this   = $(this);
                    i       = _s.cols * (Math.ceil((_li.index($this) + 1) / _s.cols));
                    
                    /**
                     * Don't click twice on the same zoom
                     */
                    if (!!_s.openZoom) {
                        if (!$this.hasClass('zoom')) {
                            evt.preventDefault();
                            createZoom(closeZoom);
                        }
                    }
                }
                else {
                    evt.preventDefault();
                }
            });
        },
        
        
        /**
         * @private
         * @name Mosaiqy#_loadThumbsFromJSON
         * @param { Number } missingThumbs How many thumbs miss on the stage
         * @description
         * If user have not defined enough images (rows * cols) as straight markup, this method
         * fill the stage with images taken from the JSON.
         */
        _loadThumbsFromJSON     = function(missingThumbs) {
            var tpl;
            while (missingThumbs--) {
                tpl = _createTemplate(_s.indexData);
                tpl.appendTo($('<li />').appendTo(_ul));
                _s.indexData = _s.indexData + 1;
            }
        };
            
            
            
        /**
         * @scope Mosaiqy
         */
        return {
            
            /**
             * @public
             * @function init
             *
             * @param { String } cnt        Mosaiqy node container
             * @param { String } options    User options for settings merge.
             * @return { Object }           Mosaiqy object instance
             */
            init    : function(cnt, options) {
                
                var imgToComplete = 0;
                
                _s = $.extend(_s, options);
                
                /* Data must not be empty */
                if (!((_s.data || []).length)) {
                    throw new Error("Data object is empty");
                }
                /* Template must not be empty and provided as a script element */
                if (!!_s.template && $("#" + _s.template).is('script')) {
                    _s.template = $("#" +_s.template).text() || $("#" +_s.template).html();
                }
                else {
                    throw new Error("User template is not defined");
                }
                    
                    
                _cnt    = cnt;
                _ul     = cnt.find('ul');
                _li     = cnt.find('li:not(.mosaiqy-zoom)');
                    
                    
                /**
                 * If thumbnails on markup are less than (cols * rows) we retrieve
                 * the missing images from the json, and we create the templates 
                 */
                imgToComplete = (_s.cols * _s.rows) - _li.length;
                if (imgToComplete) {
                    if (_s.data.length >= imgToComplete) {
                        _s.indexData = _li.length;
                        appDebug('warn', "Missing %d image/s. Load from JSON", imgToComplete);
                        _loadThumbsFromJSON(imgToComplete);
                        _li = cnt.find('li:not(.mosaiqy-zoom)');
                    }
                    else {
                        throw new Error("Mosaiqy can't find missing images on JSON data.");
                    }
                }
                    
                    
                /**
                 * Set a data attribute on each node (if not defined) so user can
                 * choose avoidDuplicate option
                 */
                if (_s.avoidDuplicates) {
                    _li.each(function(i) {
                        var $this = $(this);
                        if (typeof $this.data('mosaiqy-index') === 'undefined') {
                            $(this).data('mosaiqy-index', i);
                        }
                    });
                }
                    
                _img    = cnt.find('img');
                    
                /* define image position and retrieve entry points */
                _setInitialImageCoords();
                _getPoints();
                
                /* set mouseenter event on container */
                _cnt
                    .delegate("ul", "mouseenter.mosaiqy", function() {
                        _pauseAnimation();
                    })
                    .delegate("ul", "mouseleave.mosaiqy", function() {
                        if (!_cnt.hasClass('zoom')) {
                            _playAnimation();
                        }
                    });
                
                
                
                $.when(_img.mosaiqyImagesLoad(_s.loadTimeout, function(img) { img.animate({ opacity : '1' }, _s.fadeSpeed); }))
                /**
                 * All images have been successfully loaded
                 */
                .done(function() {
                    appDebug("info", 'All images have been successfully loaded');
                    _cnt.removeClass('loading');
                    _setNodeZoomEvent(_li);
                    _intvAnimation = setTimeout(function() {
                        _animationCycle();
                    }, _s.animationDelay);
                })
                /**
                 * One or more image have not been loaded
                 */
                .fail(function() {
                    appDebug("warn", 'One or more image have not been loaded');
                    return false;
                });
                
                return this;
            }
        };
    },
        
        
        
    /**
     * @name _$.fn
     * @description
     * 
     * Some chained methods are needed internally but it's better avoid jQuery.fn
     * unnecessary pollution. Only mosaiqy plugin/function is exposed as jQuery
     * prototype.
     */
    _$ = $.sub();
        
        
    /**
     * @lends _$.fn
     */
    _$.fn.mosaiqyImagesLoad = function(to, imgCallback) {
        
        var dfd         = $.Deferred(),
            imgLength   = this.length,
            loaded      = [],
            failed      = [],
            timeout     = to || 8419.78;
            /* waiting about 8 seconds before discarding image */
            
        appDebug("groupCollapsed", 'Start deferred load of %d image/s:', imgLength);
        
        if (imgLength) {
            
            this.each(function() {
                var i = this;
                
                /* single image deferred execution */
                $.when(
                    (function asyncImageLoader() {
                        var
                        /**
                         * @ignore
                         * This interval bounds the maximum amount of time (e.g. network
                         * excessive latency or failure, 404) before triggering the error
                         * handler for a given image. The interval is then unset when
                         * the image has loaded or if error event has been triggered.
                         */
                        imageDfd    = $.Deferred(),
                        intv        = setTimeout(function() {  $(i).trigger('error.mosaiqy'); }, timeout);
                        
                        /* single image main events */
                        $(i).one('load.mosaiqy', function() {
                                clearInterval(intv);
                                imageDfd.resolve();
                            })
                            .bind('error.mosaiqy', function() {
                                clearInterval(intv);
                                imageDfd.reject();
                            }).attr('src', i.src);
                        
                        if (i.complete) { setTimeout(function() { $(i).trigger('load.mosaiqy'); }, 10); }
                        
                        return imageDfd.promise();
                    }())
                )
                .done(function() {
                    loaded.push(i.src);
                    appDebug("log", 'Loaded', i.src);
                    if (imgCallback) { imgCallback($(i)); }
                })
                .fail(function() {
                    failed.push(i.src);
                    appDebug("warn", 'Not loaded', i.src);
                })
                .always(function() {
                    imgLength = imgLength - 1;
                    if (imgLength === 0) {
                        appDebug("groupEnd");
                        if (failed.length) {
                            dfd.reject();
                        }
                        else {
                            dfd.resolve();
                        }
                    }
                });
            });
        }
        return dfd.promise();
    };
    
    
    /**
     * @ignore
     * @lends _$.fn
     * Extends jQuery animation to support CSS3 animation if available.
     */     
    _$.fn.extend({
        _animate    : $.fn.animate,
        animate     : function(props, speed, easing, callback) {
            var options = (speed && typeof speed === "object")
                ? $.extend({}, speed)
                : {  
                    duration    : speed,  
                    complete    : callback || !callback && easing || $.isFunction(speed) && speed,
                    easing      : callback && easing || easing && !$.isFunction(easing) && easing
                };
            
            return $(this).each(function() {  
                var $this   = _$(this),
                    pos     = $this.position(),
                    cssprops = { },
                    match;
                    
                if (GPUAcceleration.isEnabled) {
                    appDebug("info", 'GPU Animation' );
                    
                    /**
                     * If a value is specified as a relative delta (e.g. '+=200px') for
                     * left or top property, we need to sum the current left (or top)
                     * position with delta.
                     */ 
                    if (typeof props === 'object') {
                        for (var p in props) {
                            if (p === 'left' || p === 'top') {
                                match = props[p].match(/^(?:\+|\-)=(\-?\d+)/);
                                if (match && match.length) {
                                    cssprops[p] = pos[p] + parseInt(match[1], 10);
                                }
                            }
                        }
                    }
                    $this.bind(GPUAcceleration.transitionEnd, function() {
                        if ($.isFunction(options.complete)) {  
                            options.complete();
                        }  
                    })
                    .css(cssprops)
                    .css(GPUAcceleration.duration, (speed / 1000) + 's');
                     
                }  
                else {
                    appDebug("info", 'jQuery Animation' );
                    $this._animate(props, options);
                }
            });
        }
    });
        
        
        
    /**
     * @lends jQuery.prototype
     */    
    $.fn.mosaiqy = function(options) {
        if (this.length) {
            return this.each(function() {
                var obj = new Mosaiqy(_$);
                obj.init(_$(this), options);
                $.data(this, 'mosaiqy', obj);
            });
        }
    };

}(jQuery));