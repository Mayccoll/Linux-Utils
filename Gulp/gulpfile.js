'use strict';

var gulp            = require('gulp-help')(require('gulp'));

var autoprefixer    = require('gulp-autoprefixer');
var browserSync     = require('browser-sync');
var changed         = require('gulp-changed');
var connectPhp      = require('gulp-connect-php');
var del             = require('del');
var es              = require('event-stream');
var fileinclude     = require('gulp-file-include')
var flatten         = require('gulp-flatten');
var gulpFilter      = require('gulp-filter');
var gulpIgnore      = require('gulp-ignore');
var gutil           = require('gulp-util');
var imagemin        = require('gulp-imagemin');
var inject          = require('gulp-inject');
var jshint          = require('gulp-jshint');
var less            = require('gulp-less');
var mainBowerFiles  = require('main-bower-files');
var merge           = require('merge-stream');
var minifyCSS       = require('gulp-minify-css');
var minifyHTML      = require('gulp-minify-html');
var notify          = require('gulp-notify');
var plumber         = require('gulp-plumber');
var pngquant        = require('imagemin-pngquant');
var rename          = require('gulp-rename');
var runSequence     = require('run-sequence');
var shell           = require('gulp-shell');
var size            = require('gulp-size');
var sourcemaps      = require('gulp-sourcemaps');
var stylish         = require('jshint-stylish');
var taskListing     = require('gulp-task-listing');
var uglyfly         = require('gulp-uglyfly');
var wiredep         = require('wiredep').stream;

var reload          = browserSync.reload;



/*
 * ::::::: Error Log
 * ........................................................................ . */

function errorLog (error) {
  console.log(error.toString());
  this.emit('end');
}



/*
 * ::::::: Help
 * ........................................................................ . */
// npm install --save-dev gulp-task-listing
// var taskListing     = require('gulp-task-listing');

// gulp.task('help', taskListing);



/*
 * ::::::: Sources
 * ........................................................................ . */
var path = {
  src: {
    self      : './src',
    css       : './src/css',
    fav       : './src/favicons',
    fonts     : './src/fonts',
    html      : './src/html',
    img       : './src/img',
    js        : './src/js',
    less      : './src/less',
    php       : './src/php',
    components: './src/components',
    compress  : './src/compress',
  },
  dist: {
    self      : './dist',
    css       : './dist/css',
    fav       : './dist/favicons',
    fonts     : './dist/fonts',
    html      : './dist/html',
    img       : './dist/img',
    js        : './dist/js',
    less      : './dist/less',
    php       : './dist/php',
    components: './dist/components',
  },
  tmp: {
    self      : './.tmp'
  }
};



/*
 * ::::::: Html
 * ........................................................................ . */
// npm install --save-dev gulp-file-include
// var fileinclude     = require('gulp-file-include')
// npm install --save-dev gulp-minify-html
// var minifyHTML      = require('gulp-minify-html');
// npm install --save-dev gulp-sourcemaps
// var sourcemaps      = require('gulp-sourcemaps');
// npm install --save-dev gul
// var rename          = require("gulp-rename");

// npm install --save-dev gulp-ignore
// var gulpIgnore      = require('gulp-ignore');

gulp.task('html', function() {

  var filter = '/**/*.templ.*';

  gulp.src([
      path.src.html + '/**/*.html'
    ])
    .pipe(sourcemaps.init())
    .pipe(fileinclude()) //< = Template
    .pipe(gulpIgnore.exclude(filter))
    .pipe(minifyHTML({
      comments: false,
      spare: true,
      empty: true,
      loose: true
    }))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(path.dist.self));
});

/*
 * ::::::: Less
 * ........................................................................ . */

// npm install --save-dev gulp-less
// var less            = require('gulp-less');
// npm install --save-dev gulp-autoprefixer
// var autoprefixer    = require('gulp-autoprefixer');
// npm install --save-dev gulp-minify-css
// var minifyCSS       = require('gulp-minify-css');
// npm install --save-dev gulp-sourcemaps
// var sourcemaps      = require('gulp-sourcemaps');
// npm install --save-dev gulp-changed
// var changed         = require('gulp-changed');
// npm install --save-dev gulp-size
// var size            = require('gulp-size');
// npm install --save-dev gulp-rename
// var rename          = require("gulp-rename");
// npm install --save-dev gulp-plumber
// var plumber         = require('gulp-plumber');
// npm install --save-dev gulp-notify
// var notify          = require('gulp-notify');

var errorLess = notify.onError({
   title:    'Error .less',
   message:  '<%= error.message %>'
});

gulp.task('less', function() {
  return gulp.src([
      path.src.less + '/**/*.less',
      '!' + path.src.less + '/**/_*.*',
      '!' + path.src.less + '/libs/*',
    ])
    // .pipe(changed(path.src.less)) // Only pass through changed files
    .pipe(plumber({
      errorHandler: errorLess
    }))
    .pipe(sourcemaps.init())
    .pipe(less())
    .pipe(autoprefixer(
      'last 2 version',
      '> 1%',
      'ie 8',
      'ie 9',
      'ios 6',
      'android 4'
    ))
    .pipe(sourcemaps.write())
    .pipe(size({
      showFiles: true
    }))
    .pipe(gulp.dest(path.src.css));
});


gulp.task('css', function() {
  return gulp.src([
      path.src.css + '/**/*.css',
      '!' + path.src.css + '/**/_*.*'
    ])
    .pipe(sourcemaps.init())
    .pipe(minifyCSS({
      keepBreaks: false,
      keepSpecialComments: 0
    }))
    .pipe(sourcemaps.write())
    .pipe(rename({
      suffix: '.min'
    }))
    .pipe(size({
      showFiles: true
    }))
    .pipe(gulp.dest(path.dist.css));
});


/*
 * ::::::: Js
 * ........................................................................ . */
// npm install --save-dev gulp-rename
// var rename          = require("gulp-rename");
// npm install --save-dev gulp-uglyfly
// var uglyfly         = require('gulp-uglyfly');
// npm install --save-dev gulp-jshint
// var jshint          = require('gulp-jshint');
// npm install --save-dev jshint-stylish
// var stylish         = require('jshint-stylish');

gulp.task('jsLint', function() {
  return gulp.src(path.src.js)
    .pipe(jshint())
    .pipe(jshint.reporter(stylish)); // present the results in a beautiful way
});

gulp.task('js', function() {
  return gulp.src(path.src.js)
    .pipe(uglyfly())
    .pipe(rename({
      suffix: '.min'
    }))
    .pipe(gulp.dest(path.dist.js)); // where to put the files
});



/*
 * ::::::: Fonts
 * ........................................................................ . */
// npm install --save-dev gulp-filterve
// var gulpFilter      = require('gulp-filter');
// npm install --save-dev gulp-flatten
// var flatten         = require('gulp-flatten');
// npm install --save-dev merge-stream
// var merge           = require('merge-stream');
// npm install --save-dev event-stream
// var es              = require('event-stream');
// npm install --save-dev main-bower-files
// var mainBowerFiles  = require('main-bower-files');

gulp.task('fonts', function (cb) {
  return es.merge(
                gulp.src(path.src.fonts),
                gulp.src(mainBowerFiles())
                )
    .pipe(gulpFilter([
                    '*.eot',
                    '*.woff',
                    '*.svg',
                    '*.ttf'
                    ]))
    .pipe(flatten())                        //<= Move files
    .pipe(gulp.dest(path.dist.fonts));
});



/*
 * ::::::: Images
 * ........................................................................ . */
// npm install --save-dev gulp-imagemin
// var imagemin = require('gulp-imagemin');
// npm install --save-dev imagemin-pngquant
// var pngquant = require('imagemin-pngquant');

gulp.task('images', function() {
  return gulp.src(path.src.img)
    .pipe(imagemin({
      progressive: true,
      svgoPlugins: [{
        removeViewBox: false
      }],
      use: [pngquant()]
    }))
    .pipe(gulp.dest(path.dist.img));
});



/*
 * ::::::: Favicons
 * ........................................................................ . */

gulp.task('favicons', function () {
  return gulp.src(path.src.fav)
    .pipe(gulp.dest(path.dist.fav))
});


/*
 * ::::::: Libs
 * ........................................................................ . */
 // npm install --save-dev main-bower-files
 // var mainBowerFiles  = require('main-bower-files');
 // npm install --save-dev gulp-filter
 // var gulpFilter      = require('gulp-filter');
 // npm install --save-dev gulp-uglyfly
 // var uglyfly         = require('gulp-uglyfly');
 // npm install --save-dev gulp-minify-css
 // var minifyCSS       = require('gulp-minify-css');
 // npm install --save-dev gulp-sourcemaps
 // var sourcemaps      = require('gulp-sourcemaps');

gulp.task('components', function() {

  var cssFilter = gulpFilter('**/*.css')
  var jsFilter = gulpFilter('**/*.js')
  var fontFilter = gulpFilter([
    '**/*.eot',
    '**/*.woff',
    '**/*.svg',
    '**/*.ttf'
  ])
  var imageFilter = gulpFilter(['**/*.gif',
    '**/*.png',
    '**/*.svg',
    '**/*.jpg',
    '**/*.jpeg'
  ])

  return gulp.src(path.src.components + '/**/*')

  /* css */
  .pipe(cssFilter)
    .pipe(sourcemaps.init())
    .pipe(minifyCSS({
      keepBreaks: false,
      keepSpecialComments: 0
    }))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(path.dist.components))
    .pipe(cssFilter.restore())

  /* Js */
  .pipe(jsFilter)
    .pipe(uglyfly())
    .pipe(gulp.dest(path.dist.components))
    .pipe(jsFilter.restore())

  /* Fonts */
  .pipe(fontFilter)
    .pipe(gulp.dest(path.dist.components))
    .pipe(fontFilter.restore())

  /* Images */
  .pipe(imageFilter)
    .pipe(gulp.dest(path.dist.components))
    .pipe(imageFilter.restore())

});



/*
 * ::::::: Zip Dist
 * ........................................................................ . */
 // npm install --save-dev gulp-shell
 // var shell = require('gulp-shell')

 gulp.task('compress', shell.task([
  'rm compress/*',
  'NAME=$(git log -1 --pretty=tformat:%h) && tar -zcvf compress/$NAME.tar.gz dist/'
]))



/*
 * ::::::: Task
 * ........................................................................ . */
gulp.task('build', function() {
  runSequence(
    'favicons',
    'components',
    'fonts',
    'images',
    'less',
    'jsLint',
    'js',
    'html',
    'css'
    // 'bower',
    // 'wiredep',
    // 'inject',
  );
});



/*
 * ::::::: Delete
 * ........................................................................ . */
// npm install --save-dev del
// var del             = require('del');

gulp.task('del-dist', false, function(cb) {
  del(path.dist.self, cb);
});
gulp.task('del-less', false, function(cb) {
  del(path.dist.less, cb);
});
gulp.task('del-js', false, function(cb) {
  del(path.dist.js, cb);
});
gulp.task('del-css', false, function(cb) {
  del(path.dist.css, cb);
});
gulp.task('del-components', false, function(cb) {
  del(path.dist.components, cb);
});



/*
 * ::::::: Watch
 * ........................................................................ . */

gulp.task('watch', function() {
  gulp.watch(path.src.html        + '/**/*', ['html']);
  gulp.watch(path.src.less        + '/**/*', ['less']);
  gulp.watch(path.src.js          + '/**/*', ['jsLint', 'js']);
  gulp.watch(path.src.css         + '/**/*', ['css',]);
  gulp.watch(path.src.components  + '/**/*', ['components',]);
});



/*
 * ::::::: reload
 * ........................................................................ . */

gulp.task('bs-reload', false, function (){
    browserSync.reload();
});



/*
 * ::::::: Devel
 * ........................................................................ . */
// npm install --save-dev browser-sync
// var browserSync     = require('browser-sync');

var helpDevel = "Serve and Watch for changes";

gulp.task('devel', helpDevel, function() {
  browserSync({
    notify: true,
    port: 9000,
    reloadDelay: 500,
    server: {
      baseDir: path.dist.self
    }
  });

  gulp.watch(path.src.html + '/**/*', ['html', 'bs-reload']);
  gulp.watch(path.src.less + '/**/*', ['less', 'bs-reload']);
  gulp.watch(path.src.js + '/**/*', ['jsLint', 'js', 'bs-reload']);
  gulp.watch(path.src.css + '/**/*', ['css', 'bs-reload']);
  gulp.watch(path.src.components + '/**/*', ['components', 'bs-reload']);
});



/*
 * ::::::: Serve
 * ........................................................................ . */
// npm install --save-dev browser-sync
// var browserSync     = require('browser-sync');

gulp.task('serve', function () {
  browserSync({
    notify: true,
    port: 9000,
    server: {
      baseDir: path.dist.self
    }
  });
});







/* ************************************************************************** */


/*
 * ::::::: wiredep inject bower components
 * ........................................................................ . */
// npm install --save-dev wiredep
// var wiredep         = require('wiredep').stream;

// gulp.task('wiredep', function () {
//   gulp.src(path.src.self + "/html/*.template")
//     .pipe(wiredep({
//       fileTypes: {
//         html: {
//           block: /(([ \t]*)<!--\s*bower:*(\S*)\s*-->)(\n|\r|.)*?(<!--\s*endbower\s*-->)/gi,
//           detect: {
//             css: /<link.*href=['"]([^'"]+)/gi,
//             js: /<script.*src=['"]([^'"]+)/gi
//           },
//           replace: {
//             css: '<link rel="stylesheet" href="libs/css/{{filePath}}" />',
//             js: '<script src="libs/js/{{filePath}}"></script>'
//           }
//         },
//       },
//       ignorePath: /..\/..\/.+\//,
//     }))
//     .pipe(gulp.dest(path.src.self + "/html"));
// });



/*
 * ::::::: Inject css and js
 * ........................................................................ . */
// npm install --save-dev gulp-inject
// var inject          = require('gulp-inject');

// gulp.task('inject', function () {

//   var target = gulp.src('./src/html/*.template')

//   var sources = gulp.src([path.dist.js + "/*.js", path.dist.css + "/*.css"], {
//     read: false
//   });

//   return target
//     .pipe(inject(sources, {
//       addRootSlash: false,
//       ignorePath: ['dist', 'src']
//     }))
//     .pipe(gulp.dest('./src/html/'));

// });



/*
 * ::::::: Bower
 * Move all bower files to selected location.
 * ........................................................................ . */
// npm install --save-dev main-bower-files
// var mainBowerFiles  = require('main-bower-files');
// npm install --save-dev gulp-filter
// var gulpFilter      = require('gulp-filter');

// gulp.task("bower", function(){

//   var jsFilter      = gulpFilter('*.js')
//   var cssFilter     = gulpFilter('*.css')
//   var fontFilter    = gulpFilter(['*.eot', '*.woff', '*.svg', '*.ttf'])
//   var imageFilter   = gulpFilter(['*.gif', '*.png', '*.svg', '*.jpg', '*.jpeg'])


//     return gulp.src(mainBowerFiles())

//         .pipe(jsFilter)
//         .pipe(gulp.dest(path.dist.libs.js))
//         .pipe(jsFilter.restore())

//         .pipe(cssFilter)
//         .pipe(gulp.dest(path.dist.libs.css))
//         .pipe(cssFilter.restore())

//         .pipe(fontFilter)
//         .pipe(gulp.dest(path.dist.libs.fonts))
//         .pipe(fontFilter.restore())

//         .pipe(imageFilter)
//         .pipe(gulp.dest(path.dist.libs.img))
//         .pipe(imageFilter.restore())

// });



/*
 * ::::::: Backup
 * ........................................................................ . */

// gulp.task('backup', function() {
//     gulp.src(path.src.self)
//      .pipe(gulp.dest(path.dist.self));
// });



/* *****************************************************************************


npm install --save-dev \
  gulp-autoprefixer \
  browser-sync \
  gulp-changed \
  gulp-connect-php \
  del \
  event-stream \
  gulp-file-includ \
  gulp-flatten \
  gulp \
  gulp-filter \
  gulp-imagemin \
  gulp-inject \
  gulp-jshint \
  gulp-less \
  main-bower-files \
  merge-stream \
  gulp-minify-css \
  gulp-minify-html \
  imagemin-pngquant \
  gulp-rename \
  run-sequence \
  gulp-size \
  gulp-sourcemaps \
  jshint-stylish \
  gulp-task-listing \
  gulp-uglyfly \
  wiredep


# | 　 ･ ·̩　　 ｡　☆　　　ﾟ｡ ＊ 　 ｡*　　+　 　＊ 　･ ｡☆+　 　＊ 　･ ｡☆　☆　　　ﾟ｡　☆
# | ·̩　　 ｡　☆　　　ﾟ｡ ＊ 　 ｡*　　+　 　＊ 　･ ｡☆+　 　＊ 　･ ｡☆　☆　　　ﾟ｡　☆　　　
# | ｡*　　+　 　＊ 　･ ｡☆ 　　　ﾟ･　　｡ﾟ･　　☆ﾟ　+ ｡　☆　　　ﾟ｡･ ·̩　　ﾟ･　　｡ﾟ･　　☆ﾟ
# |　　*　　　* 　 。 　 ･ ·̩　　 ｡　☆　　　ﾟ｡　☆　　　*　　　* 　　☆ﾟ　+ 　 　＊ 　･ ｡
# | ･　　｡ﾟ･　　 ･ ·̩　　　　　* 　 。＊ 　 ｡*　　+　 　＊ 　･ ｡☆ 　ﾟ･　　｡ﾟ･　　☆ﾟ　+ ｡
# | FIle:                   gulpfile.js
# | Creation date:          15-May-2015
# |
# | @author                 Miguel D. Quintero
# | @version                1.0
# | @link                   http://lanet.co
# |
# | Revision date:          24-May-2015
# | 　 ･ ·̩　　 ｡　☆　　　ﾟ｡ ＊ 　 ｡*　　+　 　＊ 　･ ｡☆+　 　＊ 　･ ｡☆　☆　　　ﾟ｡　☆
# | ·̩　　 ｡　☆　　　ﾟ｡ ＊ 　 ｡*　　+　 　＊ 　･ ｡☆+　 　＊ 　･ ｡☆　☆　　　ﾟ｡　☆　　　　
# | ｡*　　+　 　＊ 　･ ｡☆ 　　　ﾟ･　　｡ﾟ･　　☆ﾟ　+ ｡　☆　　　ﾟ｡･ ·̩　　ﾟ･　　｡ﾟ･　　☆ﾟ
# |　　*　　　* 　 。 　 ･ ·̩　　 ｡　☆　　　ﾟ｡　☆　　　*　　　* 　　☆ﾟ　+ 　 　＊ 　･ ｡
# | ･　　｡ﾟ･　　 ･ ·̩　　　　　* 　 。＊ 　 ｡*　　+　 　＊ 　･ ｡☆ 　ﾟ･　　｡ﾟ･　　☆ﾟ　+ ｡

*/
