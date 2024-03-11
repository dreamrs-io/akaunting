<x-layouts.landing>
   <x-slot name="title">
      Pocket | CFO
   </x-slot>
   <x-slot name="content">
      <div class="min-h-screen max-w-6xl mx-auto">
         <h1 class="text-5xl py-8 text-center">Tools</h1>
         <div class="mt-10">
            <h3 class="text-center my-10 text-gray-500">Convert To Tax Returns</h3>
            <div class="grid grid-cols-4 gap-4">
               <div class="flex-col gap-4">
                  <a class="gap-1 flex cursor-pointer items-center hover:bg-red-600 justify-start p-8 rounded-sm  group border shadow-lg hover:scale-110 transition-all " href="/tools/tax-returns/income-statement">
                     <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 640 512" class="text-red-600 group-hover:text-white" height="42" width="42" xmlns="http://www.w3.org/2000/svg">
                        <path d="M352 288h-16v-88c0-4.42-3.58-8-8-8h-13.58c-4.74 0-9.37 1.4-13.31 4.03l-15.33 10.22a7.994 7.994 0 0 0-2.22 11.09l8.88 13.31a7.994 7.994 0 0 0 11.09 2.22l.47-.31V288h-16c-4.42 0-8 3.58-8 8v16c0 4.42 3.58 8 8 8h64c4.42 0 8-3.58 8-8v-16c0-4.42-3.58-8-8-8zM608 64H32C14.33 64 0 78.33 0 96v320c0 17.67 14.33 32 32 32h576c17.67 0 32-14.33 32-32V96c0-17.67-14.33-32-32-32zM48 400v-64c35.35 0 64 28.65 64 64H48zm0-224v-64h64c0 35.35-28.65 64-64 64zm272 192c-53.02 0-96-50.15-96-112 0-61.86 42.98-112 96-112s96 50.14 96 112c0 61.87-43 112-96 112zm272 32h-64c0-35.35 28.65-64 64-64v64zm0-224c-35.35 0-64-28.65-64-64h64v64z"></path>
                     </svg>
                     <h4 class="text-sm group-hover:text-white">Income Statement</h4>
                  </a>
               </div>
               <div class="flex-col gap-4">
                  <a class="gap-1 flex cursor-pointer items-center hover:bg-blue-600 justify-start p-8 rounded-sm  group border shadow-lg hover:scale-110 transition-all " href="/tools/tax-returns/balance-sheet">
                     <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" class="text-blue-600 group-hover:text-white" height="42" width="42" xmlns="http://www.w3.org/2000/svg">
                        <path fill="none" d="M0 0h24v24H0z"></path>
                        <path fill="none" d="M0 0h24v24H0zm0 0h24v24H0zm21 19c0 1.1-.9 2-2 2H5c-1.1 0-2-.9-2-2V5c0-1.1.9-2 2-2h14c1.1 0 2 .9 2 2"></path>
                        <path d="M21 5v6.59l-3-3.01-4 4.01-4-4-4 4-3-3.01V5c0-1.1.9-2 2-2h14c1.1 0 2 .9 2 2zm-3 6.42l3 3.01V19c0 1.1-.9 2-2 2H5c-1.1 0-2-.9-2-2v-6.58l3 2.99 4-4 4 4 4-3.99z"></path>
                     </svg>
                     <h4 class="text-sm group-hover:text-white">Balance Sheet</h4>
                  </a>
               </div>
               <div class="flex-col gap-4">
                  <a class="gap-1 flex cursor-pointer items-center hover:bg-green-600 justify-start p-8 rounded-sm  group border shadow-lg hover:scale-110 transition-all " href="/tools/tax-returns/cash-flow-statement">
                     <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 640 512" class="text-green-600 group-hover:text-white" height="42" width="42" xmlns="http://www.w3.org/2000/svg">
                        <path d="M535 41c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l64 64c4.5 4.5 7 10.6 7 17s-2.5 12.5-7 17l-64 64c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l23-23L384 112c-13.3 0-24-10.7-24-24s10.7-24 24-24l174.1 0L535 41zM105 377l-23 23L256 400c13.3 0 24 10.7 24 24s-10.7 24-24 24L81.9 448l23 23c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0L7 441c-4.5-4.5-7-10.6-7-17s2.5-12.5 7-17l64-64c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9zM96 64H337.9c-3.7 7.2-5.9 15.3-5.9 24c0 28.7 23.3 52 52 52l117.4 0c-4 17 .6 35.5 13.8 48.8c20.3 20.3 53.2 20.3 73.5 0L608 169.5V384c0 35.3-28.7 64-64 64H302.1c3.7-7.2 5.9-15.3 5.9-24c0-28.7-23.3-52-52-52l-117.4 0c4-17-.6-35.5-13.8-48.8c-20.3-20.3-53.2-20.3-73.5 0L32 342.5V128c0-35.3 28.7-64 64-64zm64 64H96v64c35.3 0 64-28.7 64-64zM544 320c-35.3 0-64 28.7-64 64h64V320zM320 352a96 96 0 1 0 0-192 96 96 0 1 0 0 192z"></path>
                     </svg>
                     <h4 class="text-sm group-hover:text-white">Cash Flow Statement</h4>
                  </a>
               </div>
               <div class="flex-col gap-4">
                  <a class="gap-1 flex cursor-pointer items-center hover:bg-indigo-600 justify-start p-8 rounded-sm  group border shadow-lg hover:scale-110 transition-all " href="/tools/tax-returns/receipts">
                     <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" aria-hidden="true" class="text-indigo-600 group-hover:text-white" height="42" width="42" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 14l6-6m-5.5.5h.01m4.99 5h.01M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16l3.5-2 3.5 2 3.5-2 3.5 2zM10 8.5a.5.5 0 11-1 0 .5.5 0 011 0zm5 5a.5.5 0 11-1 0 .5.5 0 011 0z"></path>
                     </svg>
                     <h4 class="text-sm group-hover:text-white">Receipts</h4>
                  </a>
               </div>
               <div class="flex-col gap-4">
                  <a class="gap-1 flex cursor-pointer items-center hover:bg-cyan-600 justify-start p-8 rounded-sm  group border shadow-lg hover:scale-110 transition-all " href="/tools/tax-returns/invoicing-billing">
                     <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 384 512" class="text-cyan-600 group-hover:text-white" height="42" width="42" xmlns="http://www.w3.org/2000/svg">
                        <path d="M377 105L279.1 7c-4.5-4.5-10.6-7-17-7H256v128h128v-6.1c0-6.3-2.5-12.4-7-16.9zm-153 31V0H24C10.7 0 0 10.7 0 24v464c0 13.3 10.7 24 24 24h336c13.3 0 24-10.7 24-24V160H248c-13.2 0-24-10.8-24-24zM64 72c0-4.42 3.58-8 8-8h80c4.42 0 8 3.58 8 8v16c0 4.42-3.58 8-8 8H72c-4.42 0-8-3.58-8-8V72zm0 80v-16c0-4.42 3.58-8 8-8h80c4.42 0 8 3.58 8 8v16c0 4.42-3.58 8-8 8H72c-4.42 0-8-3.58-8-8zm144 263.88V440c0 4.42-3.58 8-8 8h-16c-4.42 0-8-3.58-8-8v-24.29c-11.29-.58-22.27-4.52-31.37-11.35-3.9-2.93-4.1-8.77-.57-12.14l11.75-11.21c2.77-2.64 6.89-2.76 10.13-.73 3.87 2.42 8.26 3.72 12.82 3.72h28.11c6.5 0 11.8-5.92 11.8-13.19 0-5.95-3.61-11.19-8.77-12.73l-45-13.5c-18.59-5.58-31.58-23.42-31.58-43.39 0-24.52 19.05-44.44 42.67-45.07V232c0-4.42 3.58-8 8-8h16c4.42 0 8 3.58 8 8v24.29c11.29.58 22.27 4.51 31.37 11.35 3.9 2.93 4.1 8.77.57 12.14l-11.75 11.21c-2.77 2.64-6.89 2.76-10.13.73-3.87-2.43-8.26-3.72-12.82-3.72h-28.11c-6.5 0-11.8 5.92-11.8 13.19 0 5.95 3.61 11.19 8.77 12.73l45 13.5c18.59 5.58 31.58 23.42 31.58 43.39 0 24.53-19.05 44.44-42.67 45.07z"></path>
                     </svg>
                     <h4 class="text-sm group-hover:text-white">Invoicing and Billing</h4>
                  </a>
               </div>
               <div class="flex-col gap-4">
                  <a class="gap-1 flex cursor-pointer items-center hover:bg-teal-600 justify-start p-8 rounded-sm  group border shadow-lg hover:scale-110 transition-all " href="/tools/tax-returns/purchase-orders">
                     <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" class="text-teal-600 group-hover:text-white" height="42" width="42" xmlns="http://www.w3.org/2000/svg">
                        <path d="M12.586 2.586A2 2 0 0 0 11.172 2H4a2 2 0 0 0-2 2v7.172a2 2 0 0 0 .586 1.414l8 8a2 2 0 0 0 2.828 0l7.172-7.172a2 2 0 0 0 0-2.828l-8-8zM7 9a2 2 0 1 1 .001-4.001A2 2 0 0 1 7 9z"></path>
                     </svg>
                     <h4 class="text-sm group-hover:text-white">Purchase Orders</h4>
                  </a>
               </div>
               <div class="flex-col gap-4">
                  <a class="gap-1 flex cursor-pointer items-center hover:bg-orange-600 justify-start p-8 rounded-sm  group border shadow-lg hover:scale-110 transition-all " href="/tools/tax-returns/payroll-records">
                     <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="text-orange-600 group-hover:text-white" height="42" width="42" xmlns="http://www.w3.org/2000/svg">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                        <path d="M9 5h-2a2 2 0 0 0 -2 2v12a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-12a2 2 0 0 0 -2 -2h-2"></path>
                        <path d="M9 3m0 2a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v0a2 2 0 0 1 -2 2h-2a2 2 0 0 1 -2 -2z"></path>
                        <path d="M14 11h-2.5a1.5 1.5 0 0 0 0 3h1a1.5 1.5 0 0 1 0 3h-2.5"></path>
                        <path d="M12 17v1m0 -8v1"></path>
                     </svg>
                     <h4 class="text-sm group-hover:text-white">Payroll Records</h4>
                  </a>
               </div>
            </div>
            <h3 class="text-center my-10 text-gray-500">Convert to Financial Statements</h3>
            <div class="grid grid-cols-4 gap-4">
               <div class="flex-col gap-4">
                  <a class="gap-1 flex cursor-pointer items-center hover:bg-red-600 justify-start p-8 rounded-sm  group border shadow-lg hover:scale-110 transition-all " href="/tools/financial-statements/tax-returns-filings">
                     <svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24" aria-hidden="true" class="text-red-600 group-hover:text-white" height="42" width="42" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h3.75M9 15h3.75M9 18h3.75m3 .75H18a2.25 2.25 0 002.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 00-1.123-.08m-5.801 0c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 00.75-.75 2.25 2.25 0 00-.1-.664m-5.8 0A2.251 2.251 0 0113.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m0 0H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V9.375c0-.621-.504-1.125-1.125-1.125H8.25zM6.75 12h.008v.008H6.75V12zm0 3h.008v.008H6.75V15zm0 3h.008v.008H6.75V18z"></path>
                     </svg>
                     <h4 class="text-sm group-hover:text-white">Tax Returns and Filings</h4>
                  </a>
               </div>
               <div class="flex-col gap-4">
                  <a class="gap-1 flex cursor-pointer items-center hover:bg-blue-600 justify-start p-8 rounded-sm  group border shadow-lg hover:scale-110 transition-all " href="/tools/financial-statements/balance-statements">
                     <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" class="text-blue-600 group-hover:text-white" height="42" width="42" xmlns="http://www.w3.org/2000/svg">
                        <path fill="none" d="M0 0h24v24H0z"></path>
                        <path fill="none" d="M0 0h24v24H0zm0 0h24v24H0zm21 19c0 1.1-.9 2-2 2H5c-1.1 0-2-.9-2-2V5c0-1.1.9-2 2-2h14c1.1 0 2 .9 2 2"></path>
                        <path d="M21 5v6.59l-3-3.01-4 4.01-4-4-4 4-3-3.01V5c0-1.1.9-2 2-2h14c1.1 0 2 .9 2 2zm-3 6.42l3 3.01V19c0 1.1-.9 2-2 2H5c-1.1 0-2-.9-2-2v-6.58l3 2.99 4-4 4 4 4-3.99z"></path>
                     </svg>
                     <h4 class="text-sm group-hover:text-white">Balance Statements</h4>
                  </a>
               </div>
               <div class="flex-col gap-4">
                  <a class="gap-1 flex cursor-pointer items-center hover:bg-green-600 justify-start p-8 rounded-sm  group border shadow-lg hover:scale-110 transition-all " href="/tools/financial-statements/receipts">
                     <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" aria-hidden="true" class="text-green-600 group-hover:text-white" height="42" width="42" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 14l6-6m-5.5.5h.01m4.99 5h.01M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16l3.5-2 3.5 2 3.5-2 3.5 2zM10 8.5a.5.5 0 11-1 0 .5.5 0 011 0zm5 5a.5.5 0 11-1 0 .5.5 0 011 0z"></path>
                     </svg>
                     <h4 class="text-sm group-hover:text-white">Receipts</h4>
                  </a>
               </div>
               <div class="flex-col gap-4">
                  <a class="gap-1 flex cursor-pointer items-center hover:bg-yellow-600 justify-start p-8 rounded-sm  group border shadow-lg hover:scale-110 transition-all " href="/tools/financial-statements/invoicing-billing">
                     <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 384 512" class="text-yellow-600 group-hover:text-white" height="42" width="42" xmlns="http://www.w3.org/2000/svg">
                        <path d="M377 105L279.1 7c-4.5-4.5-10.6-7-17-7H256v128h128v-6.1c0-6.3-2.5-12.4-7-16.9zm-153 31V0H24C10.7 0 0 10.7 0 24v464c0 13.3 10.7 24 24 24h336c13.3 0 24-10.7 24-24V160H248c-13.2 0-24-10.8-24-24zM64 72c0-4.42 3.58-8 8-8h80c4.42 0 8 3.58 8 8v16c0 4.42-3.58 8-8 8H72c-4.42 0-8-3.58-8-8V72zm0 80v-16c0-4.42 3.58-8 8-8h80c4.42 0 8 3.58 8 8v16c0 4.42-3.58 8-8 8H72c-4.42 0-8-3.58-8-8zm144 263.88V440c0 4.42-3.58 8-8 8h-16c-4.42 0-8-3.58-8-8v-24.29c-11.29-.58-22.27-4.52-31.37-11.35-3.9-2.93-4.1-8.77-.57-12.14l11.75-11.21c2.77-2.64 6.89-2.76 10.13-.73 3.87 2.42 8.26 3.72 12.82 3.72h28.11c6.5 0 11.8-5.92 11.8-13.19 0-5.95-3.61-11.19-8.77-12.73l-45-13.5c-18.59-5.58-31.58-23.42-31.58-43.39 0-24.52 19.05-44.44 42.67-45.07V232c0-4.42 3.58-8 8-8h16c4.42 0 8 3.58 8 8v24.29c11.29.58 22.27 4.51 31.37 11.35 3.9 2.93 4.1 8.77.57 12.14l-11.75 11.21c-2.77 2.64-6.89 2.76-10.13.73-3.87-2.43-8.26-3.72-12.82-3.72h-28.11c-6.5 0-11.8 5.92-11.8 13.19 0 5.95 3.61 11.19 8.77 12.73l45 13.5c18.59 5.58 31.58 23.42 31.58 43.39 0 24.53-19.05 44.44-42.67 45.07z"></path>
                     </svg>
                     <h4 class="text-sm group-hover:text-white">Invoicing and Billing</h4>
                  </a>
               </div>
               <div class="flex-col gap-4">
                  <a class="gap-1 flex cursor-pointer items-center hover:bg-indigo-600 justify-start p-8 rounded-sm  group border shadow-lg hover:scale-110 transition-all " href="/tools/financial-statements/purchase-orders">
                     <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" class="text-indigo-600 group-hover:text-white" height="42" width="42" xmlns="http://www.w3.org/2000/svg">
                        <path d="M13.707 3.293A.996.996 0 0 0 13 3H4a1 1 0 0 0-1 1v9c0 .266.105.52.293.707l8 8a.997.997 0 0 0 1.414 0l9-9a.999.999 0 0 0 0-1.414l-8-8zM12 19.586l-7-7V5h7.586l7 7L12 19.586z"></path>
                        <circle cx="8.496" cy="8.495" r="1.505"></circle>
                     </svg>
                     <h4 class="text-sm group-hover:text-white">Purchase Orders</h4>
                  </a>
               </div>
               <div class="flex-col gap-4">
                  <a class="gap-1 flex cursor-pointer items-center hover:bg-cyan-600 justify-start p-8 rounded-sm  group border shadow-lg hover:scale-110 transition-all " href="/tools/financial-statements/payroll-records">
                     <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="text-cyan-600 group-hover:text-white" height="42" width="42" xmlns="http://www.w3.org/2000/svg">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                        <path d="M9 5h-2a2 2 0 0 0 -2 2v12a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-12a2 2 0 0 0 -2 -2h-2"></path>
                        <path d="M9 3m0 2a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v0a2 2 0 0 1 -2 2h-2a2 2 0 0 1 -2 -2z"></path>
                        <path d="M14 11h-2.5a1.5 1.5 0 0 0 0 3h1a1.5 1.5 0 0 1 0 3h-2.5"></path>
                        <path d="M12 17v1m0 -8v1"></path>
                     </svg>
                     <h4 class="text-sm group-hover:text-white">Payroll Records</h4>
                  </a>
               </div>
            </div>
         </div>
      </div>
   </x-slot>
</x-layouts.landing>