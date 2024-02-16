<!-- Core -->
<script src="{{ asset('public/vendor/js-cookie/js.cookie.js') }}"></script>


@stack('scripts_start')


<script type="text/javascript" src="{{ asset('public/modules/chat-gpt/js/chat-gpt.min.js') }}"></script>
{{-- <script type="text/javascript" src="{{ asset('modules/ChatGpt/Resources/assets/js/chat-gpt.min.js') }}"></script> --}}



@stack('body_css')

@stack('body_stylesheet')

@stack('body_js')

@stack('body_scripts')


@stack('scripts_end')