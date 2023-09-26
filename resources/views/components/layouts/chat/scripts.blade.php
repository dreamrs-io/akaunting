<!-- Core -->
<script src="{{ asset('public/vendor/js-cookie/js.cookie.js') }}"></script>


@stack('scripts_start')

@apexchartsScripts

@stack('charts')

<!-- <script type="text/javascript" src="{{ asset('public/akaunting-js/hotkeys.js') }}" defer></script> -->
<script type="text/javascript" src="{{ asset('public/akaunting-js/generalAction.js') }}"></script>
<script type="text/javascript" src="{{ asset('public/akaunting-js/popper.js') }}"></script>


@stack('body_css')

@stack('body_stylesheet')

@stack('body_js')

@stack('body_scripts')


@stack('scripts_end')