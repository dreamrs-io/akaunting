@stack('footer_start')

<div class="border-t">
    <div class="max-w-7xl mx-auto my-10 p-2 lg:p-6">
        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5">
            @foreach(config('static-data.tools') as $tool)
                <div>
                    <p class="text-sm ml-2 mb-2 text-gray-400"> {{$tool['title'] }}</p>
                    @foreach($tool['tools'] as $subTool)
                    <a class="gap-1 flex cursor-pointer items-center hover:bg-red-600 justify-start p-2 rounded-sm group" 
                        href="/home/tools/{{$tool['category']}}/{{$subTool['page']['url']}}"
                        
                        >
                        {!! $subTool['icon'] !!}
                        <p class="text-sm font-bold group-hover:text-white">
                            {{ $subTool['name'] }}
                        </p>
                    </a>
                    @endforeach
                </div>
            @endforeach
            
          
        </div>
    </div>
</div>



<div class="border-t">
    <div class="max-w-7xl mx-auto my-10 p-2 lg:p-6">
        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5">
            <div>
                <p class="text-sm ml-2 mb-2 text-gray-400">Convert To Tax Returns</p>
                <div class="flex-col gap-4">
                    <a class="gap-1 flex cursor-pointer items-center hover:bg-red-600 justify-start p-2 rounded-sm group" href="/tools/tax-returns/income-statement">
                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 640 512" class="text-red-600 group-hover:text-white" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M352 288h-16v-88c0-4.42-3.58-8-8-8h-13.58c-4.74 0-9.37 1.4-13.31 4.03l-15.33 10.22a7.994 7.994 0 0 0-2.22 11.09l8.88 13.31a7.994 7.994 0 0 0 11.09 2.22l.47-.31V288h-16c-4.42 0-8 3.58-8 8v16c0 4.42 3.58 8 8 8h64c4.42 0 8-3.58 8-8v-16c0-4.42-3.58-8-8-8zM608 64H32C14.33 64 0 78.33 0 96v320c0 17.67 14.33 32 32 32h576c17.67 0 32-14.33 32-32V96c0-17.67-14.33-32-32-32zM48 400v-64c35.35 0 64 28.65 64 64H48zm0-224v-64h64c0 35.35-28.65 64-64 64zm272 192c-53.02 0-96-50.15-96-112 0-61.86 42.98-112 96-112s96 50.14 96 112c0 61.87-43 112-96 112zm272 32h-64c0-35.35 28.65-64 64-64v64zm0-224c-35.35 0-64-28.65-64-64h64v64z"></path>
                        </svg>
                        <p class="text-sm font-bold group-hover:text-white">
                            Income Statement
                        </p>
                    </a>
                </div>
                <div class="flex-col gap-4">
                    <a class="gap-1 flex cursor-pointer items-center hover:bg-blue-600 justify-start p-2 rounded-sm group" href="/tools/tax-returns/balance-sheet">
                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" class="text-blue-600 group-hover:text-white" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path fill="none" d="M0 0h24v24H0z"></path>
                            <path fill="none" d="M0 0h24v24H0zm0 0h24v24H0zm21 19c0 1.1-.9 2-2 2H5c-1.1 0-2-.9-2-2V5c0-1.1.9-2 2-2h14c1.1 0 2 .9 2 2"></path>
                            <path d="M21 5v6.59l-3-3.01-4 4.01-4-4-4 4-3-3.01V5c0-1.1.9-2 2-2h14c1.1 0 2 .9 2 2zm-3 6.42l3 3.01V19c0 1.1-.9 2-2 2H5c-1.1 0-2-.9-2-2v-6.58l3 2.99 4-4 4 4 4-3.99z"></path>
                        </svg>
                        <p class="text-sm font-bold group-hover:text-white">
                            Balance Sheet
                        </p>
                    </a>
                </div>
                <div class="flex-col gap-4">
                    <a class="gap-1 flex cursor-pointer items-center hover:bg-green-600 justify-start p-2 rounded-sm group" href="/tools/tax-returns/cash-flow-statement"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 640 512" class="text-green-600 group-hover:text-white" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M535 41c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l64 64c4.5 4.5 7 10.6 7 17s-2.5 12.5-7 17l-64 64c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l23-23L384 112c-13.3 0-24-10.7-24-24s10.7-24 24-24l174.1 0L535 41zM105 377l-23 23L256 400c13.3 0 24 10.7 24 24s-10.7 24-24 24L81.9 448l23 23c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0L7 441c-4.5-4.5-7-10.6-7-17s2.5-12.5 7-17l64-64c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9zM96 64H337.9c-3.7 7.2-5.9 15.3-5.9 24c0 28.7 23.3 52 52 52l117.4 0c-4 17 .6 35.5 13.8 48.8c20.3 20.3 53.2 20.3 73.5 0L608 169.5V384c0 35.3-28.7 64-64 64H302.1c3.7-7.2 5.9-15.3 5.9-24c0-28.7-23.3-52-52-52l-117.4 0c4-17-.6-35.5-13.8-48.8c-20.3-20.3-53.2-20.3-73.5 0L32 342.5V128c0-35.3 28.7-64 64-64zm64 64H96v64c35.3 0 64-28.7 64-64zM544 320c-35.3 0-64 28.7-64 64h64V320zM320 352a96 96 0 1 0 0-192 96 96 0 1 0 0 192z"></path>
                        </svg>
                        <p class="text-sm font-bold group-hover:text-white">
                            Cash Flow Statement
                        </p>
                    </a>
                </div>
                <div class="flex-col gap-4">
                    <a class="gap-1 flex cursor-pointer items-center hover:bg-indigo-600 justify-start p-2 rounded-sm group" href="/tools/tax-returns/receipts"><svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" aria-hidden="true" class="text-indigo-600 group-hover:text-white" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 14l6-6m-5.5.5h.01m4.99 5h.01M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16l3.5-2 3.5 2 3.5-2 3.5 2zM10 8.5a.5.5 0 11-1 0 .5.5 0 011 0zm5 5a.5.5 0 11-1 0 .5.5 0 011 0z"></path>
                        </svg>
                        <p class="text-sm font-bold group-hover:text-white">Receipts</p>
                    </a>
                </div>
                <div class="flex-col gap-4">
                    <a class="gap-1 flex cursor-pointer items-center hover:bg-cyan-600 justify-start p-2 rounded-sm group" href="/tools/tax-returns/invoicing-billing"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 384 512" class="text-cyan-600 group-hover:text-white" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M377 105L279.1 7c-4.5-4.5-10.6-7-17-7H256v128h128v-6.1c0-6.3-2.5-12.4-7-16.9zm-153 31V0H24C10.7 0 0 10.7 0 24v464c0 13.3 10.7 24 24 24h336c13.3 0 24-10.7 24-24V160H248c-13.2 0-24-10.8-24-24zM64 72c0-4.42 3.58-8 8-8h80c4.42 0 8 3.58 8 8v16c0 4.42-3.58 8-8 8H72c-4.42 0-8-3.58-8-8V72zm0 80v-16c0-4.42 3.58-8 8-8h80c4.42 0 8 3.58 8 8v16c0 4.42-3.58 8-8 8H72c-4.42 0-8-3.58-8-8zm144 263.88V440c0 4.42-3.58 8-8 8h-16c-4.42 0-8-3.58-8-8v-24.29c-11.29-.58-22.27-4.52-31.37-11.35-3.9-2.93-4.1-8.77-.57-12.14l11.75-11.21c2.77-2.64 6.89-2.76 10.13-.73 3.87 2.42 8.26 3.72 12.82 3.72h28.11c6.5 0 11.8-5.92 11.8-13.19 0-5.95-3.61-11.19-8.77-12.73l-45-13.5c-18.59-5.58-31.58-23.42-31.58-43.39 0-24.52 19.05-44.44 42.67-45.07V232c0-4.42 3.58-8 8-8h16c4.42 0 8 3.58 8 8v24.29c11.29.58 22.27 4.51 31.37 11.35 3.9 2.93 4.1 8.77.57 12.14l-11.75 11.21c-2.77 2.64-6.89 2.76-10.13.73-3.87-2.43-8.26-3.72-12.82-3.72h-28.11c-6.5 0-11.8 5.92-11.8 13.19 0 5.95 3.61 11.19 8.77 12.73l45 13.5c18.59 5.58 31.58 23.42 31.58 43.39 0 24.53-19.05 44.44-42.67 45.07z"></path>
                        </svg>
                        <p class="text-sm font-bold group-hover:text-white">
                            Invoicing and Billing
                        </p>
                    </a>
                </div>
                <div class="flex-col gap-4">
                    <a class="gap-1 flex cursor-pointer items-center hover:bg-teal-600 justify-start p-2 rounded-sm group" href="/tools/tax-returns/purchase-orders"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" class="text-teal-600 group-hover:text-white" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12.586 2.586A2 2 0 0 0 11.172 2H4a2 2 0 0 0-2 2v7.172a2 2 0 0 0 .586 1.414l8 8a2 2 0 0 0 2.828 0l7.172-7.172a2 2 0 0 0 0-2.828l-8-8zM7 9a2 2 0 1 1 .001-4.001A2 2 0 0 1 7 9z"></path>
                        </svg>
                        <p class="text-sm font-bold group-hover:text-white">
                            Purchase Orders
                        </p>
                    </a>
                </div>
                <div class="flex-col gap-4">
                    <a class="gap-1 flex cursor-pointer items-center hover:bg-orange-600 justify-start p-2 rounded-sm group" href="/tools/tax-returns/payroll-records"><svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="text-orange-600 group-hover:text-white" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                            <path d="M9 5h-2a2 2 0 0 0 -2 2v12a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-12a2 2 0 0 0 -2 -2h-2"></path>
                            <path d="M9 3m0 2a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v0a2 2 0 0 1 -2 2h-2a2 2 0 0 1 -2 -2z"></path>
                            <path d="M14 11h-2.5a1.5 1.5 0 0 0 0 3h1a1.5 1.5 0 0 1 0 3h-2.5"></path>
                            <path d="M12 17v1m0 -8v1"></path>
                        </svg>
                        <p class="text-sm font-bold group-hover:text-white">
                            Payroll Records
                        </p>
                    </a>
                </div>
            </div>
            <div>
                <p class="text-sm ml-2 mb-2 text-gray-400">
                    Convert to Financial Statements
                </p>
                <div class="flex-col gap-4">
                    <a class="gap-1 flex cursor-pointer items-center hover:bg-red-600 justify-start p-2 rounded-sm group" href="/tools/financial-statements/tax-returns-filings"><svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24" aria-hidden="true" class="text-red-600 group-hover:text-white" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h3.75M9 15h3.75M9 18h3.75m3 .75H18a2.25 2.25 0 002.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 00-1.123-.08m-5.801 0c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 00.75-.75 2.25 2.25 0 00-.1-.664m-5.8 0A2.251 2.251 0 0113.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m0 0H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V9.375c0-.621-.504-1.125-1.125-1.125H8.25zM6.75 12h.008v.008H6.75V12zm0 3h.008v.008H6.75V15zm0 3h.008v.008H6.75V18z"></path>
                        </svg>
                        <p class="text-sm font-bold group-hover:text-white">
                            Tax Returns and Filings
                        </p>
                    </a>
                </div>
                <div class="flex-col gap-4">
                    <a class="gap-1 flex cursor-pointer items-center hover:bg-blue-600 justify-start p-2 rounded-sm group" href="/tools/financial-statements/balance-statements">
                        
                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" class="text-blue-600 group-hover:text-white" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path fill="none" d="M0 0h24v24H0z"></path>
                            <path fill="none" d="M0 0h24v24H0zm0 0h24v24H0zm21 19c0 1.1-.9 2-2 2H5c-1.1 0-2-.9-2-2V5c0-1.1.9-2 2-2h14c1.1 0 2 .9 2 2"></path>
                            <path d="M21 5v6.59l-3-3.01-4 4.01-4-4-4 4-3-3.01V5c0-1.1.9-2 2-2h14c1.1 0 2 .9 2 2zm-3 6.42l3 3.01V19c0 1.1-.9 2-2 2H5c-1.1 0-2-.9-2-2v-6.58l3 2.99 4-4 4 4 4-3.99z"></path>
                        </svg>
                        <p class="text-sm font-bold group-hover:text-white">
                            Balance Statements
                        </p>
                    </a>
                </div>
                <div class="flex-col gap-4">
                    <a class="gap-1 flex cursor-pointer items-center hover:bg-green-600 justify-start p-2 rounded-sm group" href="/tools/financial-statements/receipts"><svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" aria-hidden="true" class="text-green-600 group-hover:text-white" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 14l6-6m-5.5.5h.01m4.99 5h.01M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16l3.5-2 3.5 2 3.5-2 3.5 2zM10 8.5a.5.5 0 11-1 0 .5.5 0 011 0zm5 5a.5.5 0 11-1 0 .5.5 0 011 0z"></path>
                        </svg>
                        <p class="text-sm font-bold group-hover:text-white">Receipts</p>
                    </a>
                </div>
                <div class="flex-col gap-4">
                    <a class="gap-1 flex cursor-pointer items-center hover:bg-yellow-600 justify-start p-2 rounded-sm group" href="/tools/financial-statements/invoicing-billing"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 384 512" class="text-yellow-600 group-hover:text-white" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M377 105L279.1 7c-4.5-4.5-10.6-7-17-7H256v128h128v-6.1c0-6.3-2.5-12.4-7-16.9zm-153 31V0H24C10.7 0 0 10.7 0 24v464c0 13.3 10.7 24 24 24h336c13.3 0 24-10.7 24-24V160H248c-13.2 0-24-10.8-24-24zM64 72c0-4.42 3.58-8 8-8h80c4.42 0 8 3.58 8 8v16c0 4.42-3.58 8-8 8H72c-4.42 0-8-3.58-8-8V72zm0 80v-16c0-4.42 3.58-8 8-8h80c4.42 0 8 3.58 8 8v16c0 4.42-3.58 8-8 8H72c-4.42 0-8-3.58-8-8zm144 263.88V440c0 4.42-3.58 8-8 8h-16c-4.42 0-8-3.58-8-8v-24.29c-11.29-.58-22.27-4.52-31.37-11.35-3.9-2.93-4.1-8.77-.57-12.14l11.75-11.21c2.77-2.64 6.89-2.76 10.13-.73 3.87 2.42 8.26 3.72 12.82 3.72h28.11c6.5 0 11.8-5.92 11.8-13.19 0-5.95-3.61-11.19-8.77-12.73l-45-13.5c-18.59-5.58-31.58-23.42-31.58-43.39 0-24.52 19.05-44.44 42.67-45.07V232c0-4.42 3.58-8 8-8h16c4.42 0 8 3.58 8 8v24.29c11.29.58 22.27 4.51 31.37 11.35 3.9 2.93 4.1 8.77.57 12.14l-11.75 11.21c-2.77 2.64-6.89 2.76-10.13.73-3.87-2.43-8.26-3.72-12.82-3.72h-28.11c-6.5 0-11.8 5.92-11.8 13.19 0 5.95 3.61 11.19 8.77 12.73l45 13.5c18.59 5.58 31.58 23.42 31.58 43.39 0 24.53-19.05 44.44-42.67 45.07z"></path>
                        </svg>
                        <p class="text-sm font-bold group-hover:text-white">
                            Invoicing and Billing
                        </p>
                    </a>
                </div>
                <div class="flex-col gap-4">
                    <a class="gap-1 flex cursor-pointer items-center hover:bg-indigo-600 justify-start p-2 rounded-sm group" href="/tools/financial-statements/purchase-orders"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" class="text-indigo-600 group-hover:text-white" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M13.707 3.293A.996.996 0 0 0 13 3H4a1 1 0 0 0-1 1v9c0 .266.105.52.293.707l8 8a.997.997 0 0 0 1.414 0l9-9a.999.999 0 0 0 0-1.414l-8-8zM12 19.586l-7-7V5h7.586l7 7L12 19.586z"></path>
                            <circle cx="8.496" cy="8.495" r="1.505"></circle>
                        </svg>
                        <p class="text-sm font-bold group-hover:text-white">
                            Purchase Orders
                        </p>
                    </a>
                </div>
                <div class="flex-col gap-4">
                    <a class="gap-1 flex cursor-pointer items-center hover:bg-cyan-600 justify-start p-2 rounded-sm group" href="/tools/financial-statements/payroll-records"><svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="text-cyan-600 group-hover:text-white" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                            <path d="M9 5h-2a2 2 0 0 0 -2 2v12a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-12a2 2 0 0 0 -2 -2h-2"></path>
                            <path d="M9 3m0 2a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v0a2 2 0 0 1 -2 2h-2a2 2 0 0 1 -2 -2z"></path>
                            <path d="M14 11h-2.5a1.5 1.5 0 0 0 0 3h1a1.5 1.5 0 0 1 0 3h-2.5"></path>
                            <path d="M12 17v1m0 -8v1"></path>
                        </svg>
                        <p class="text-sm font-bold group-hover:text-white">
                            Payroll Records
                        </p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="border-t mt-10">
    <div class="container mx-auto">
        <section class="flex-col lg:flex-row flex justify-between items-center p-8">
            <div class="mb-8 md:mb-0">
                <div class="flex gap-2 items-center">
                    <img alt="logo" loading="lazy" width="50" height="20" decoding="async" data-nimg="1" class="" style="color:transparent" src="{{ asset('public/img/pocket-cfo/logo.svg') }}" />
                    <p class="text-2xl font-extrabold">PocketCFO</p>
                </div>
                <p class="mt-4 font-semibold">We Make Finance Easy</p>
            </div>
            <div class="grid grid-cols-2 lg:grid-cols-4 w-3/4 gap-4">
                <div class="flex flex-col gap-3 lg:gap-4 items-center">
                    <p class="font-bold underline underline-offset-4">Solutions</p>
                    <a class="link text-sm" href="/blogs/small-business-taxes">Business Taxes For Beginners</a><a class="link text-sm" href="/blogs/what-is-payroll-tax">Understanding Payroll</a><a class="link text-sm" href="/blogs/navigating-complex-business-taxation-with-pocketcfo">Bussiness Taxation</a><a class="link text-sm" href="/blogs/demystifying-the-world-of-taxes-with-pocketcfo">World of Taxes</a>
                </div>
                <div class="flex flex-col gap-3 lg:gap-4 items-center">
                    <p class="font-bold underline underline-offset-4">Product</p>
                    <a class="link text-sm" href="/#">AI Converter</a><a class="link text-sm" href="/#">Invovation</a>
                </div>
                <div class="flex flex-col gap-3 lg:gap-4 items-center">
                    <p class="font-bold underline underline-offset-4">Company</p>
                    <a class="link text-sm" href="/">About Us</a><a class="link text-sm" href="/">Contact Us</a><a class="link text-sm" href="/">Join Us</a>
                </div>
            </div>
        </section>
    </div>
    <section class="border-t p-4">
        <div class="flex lg:flex-row flex-col-reverse justify-between container mx-auto">
            <p class="flex items-center gap-2 mb-4">
                ©
                2024
                PocketCfos — Made with<span><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 1024 1024" class="text-red-600 animate-bounce" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                        <path d="M923 283.6a260.04 260.04 0 0 0-56.9-82.8 264.4 264.4 0 0 0-84-55.5A265.34 265.34 0 0 0 679.7 125c-49.3 0-97.4 13.5-139.2 39-10 6.1-19.5 12.8-28.5 20.1-9-7.3-18.5-14-28.5-20.1-41.8-25.5-89.9-39-139.2-39-35.5 0-69.9 6.8-102.4 20.3-31.4 13-59.7 31.7-84 55.5a258.44 258.44 0 0 0-56.9 82.8c-13.9 32.3-21 66.6-21 101.9 0 33.3 6.8 68 20.3 103.3 11.3 29.5 27.5 60.1 48.2 91 32.8 48.9 77.9 99.9 133.9 151.6 92.8 85.7 184.7 144.9 188.6 147.3l23.7 15.2c10.5 6.7 24 6.7 34.5 0l23.7-15.2c3.9-2.5 95.7-61.6 188.6-147.3 56-51.7 101.1-102.7 133.9-151.6 20.7-30.9 37-61.5 48.2-91 13.5-35.3 20.3-70 20.3-103.3.1-35.3-7-69.6-20.9-101.9z"></path>
                    </svg></span>for the people of the internet.
            </p>
            <div class="flex items-center justify-between ml-auto mb-4">
                <div class="flex items-center gap-4">
                    <a class="p-2 border-2 border-dashed group hover:border-[#1877F2] duration-500 transition-all" href="/#"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="text-muted group-hover:text-[#1877F2] duration-500 transition-all" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                            <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"></path>
                        </svg></a><a class="p-2 border-2 border-dashed group hover:border-[#00acee] duration-500 transition-all" href="/#"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="text-muted group-hover:text-[#00acee] duration-500 transition-all" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                            <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"></path>
                        </svg></a><a class="p-2 border-2 border-dashed group hover:border-[#0077b5] duration-500 transition-all" href="/#"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" class="text-muted group-hover:text-[#0077b5] duration-500 transition-all" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                            <path d="M416 32H31.9C14.3 32 0 46.5 0 64.3v383.4C0 465.5 14.3 480 31.9 480H416c17.6 0 32-14.5 32-32.3V64.3c0-17.8-14.4-32.3-32-32.3zM135.4 416H69V202.2h66.5V416zm-33.2-243c-21.3 0-38.5-17.3-38.5-38.5S80.9 96 102.2 96c21.2 0 38.5 17.3 38.5 38.5 0 21.3-17.2 38.5-38.5 38.5zm282.1 243h-66.4V312c0-24.8-.5-56.7-34.5-56.7-34.6 0-39.9 27-39.9 54.9V416h-66.4V202.2h63.7v29.2h.9c8.9-16.8 30.6-34.5 62.9-34.5 67.2 0 79.7 44.3 79.7 101.9V416z"></path>
                        </svg></a><a class="p-2 border-2 border-dashed group hover:border-[#8a3ab9] duration-500 transition-all" href="/#"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" class="text-muted group-hover:text-[#8a3ab9] duration-500 transition-all" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                            <path d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"></path>
                        </svg></a><a class="p-2 border-2 border-dashed group hover:border-red-600 duration-500 transition-all" href="/#"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="text-muted group-hover:text-red-600 duration-500 transition-all" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                            <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z"></path>
                        </svg></a>
                </div>
            </div>
        </div>
    </section>
</footer>
@stack('footer_end')