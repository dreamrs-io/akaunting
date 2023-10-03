module.exports = {
    presets: [
        require('./presets.js'),
    ],

    content: [
        './resources/views/**/*.blade.php',
        './resources/views/**/**/*.blade.php',
        './resources/assets/js/components/**/*.vue',
        './resources/assets/js/**/*.vue',
         '.modules/ChatGpt/Resources/assets/js/**/*.vue',
        './modules/ChatGpt/Resources/assets/js/components/**/*.vue',
        './resources/lang/**/*.php',
        './vendor/akaunting/laravel-menu/src/Presenters/Admin/Tailwind.php',
        './safelist.txt'
    ],

    theme: {
        extend: {
            colors: {
                'testing': '#935f07'
            }
        }
    }
};
