## 2nd-Dev

### Creating a module
```
php artisan module:make chat-gpt
```
### Installing the module
```
php artisan module:install chat-gpt 1
```
chat-gpt is the alias of the module and 1 is the company id that you want to install the module. 

```
php artisan module:make-model Chat chat-gpt
php artisan module:make-migration Chat chat-gpt
php artisan module:make-factory Chat chat-gpt
php artisan module:migrate chat-gpt
php artisan module:make-job CreateChat chat-gpt

<!-- publis js [abandon, using npm run watch or mix watch instead] -->
<!-- php artisan module:publish chat-gpt -->
```

### compile vue js
modify /webpack.mix.js
```
// add compile map
    .js('modules/ChatGpt/Resources/assets/js/chat-gpt.js', 'public/modules/chat-gpt/js/chat-gpt.min.js')

npm run watch
```
