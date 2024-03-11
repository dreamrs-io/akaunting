<nav class="p-2 border-b h-14 ">
   <div class="flex justify-between items-center">
      <div class="flex items-center gap-8">
         <a class="flex gap-1 items-center" href="/">
            <img alt="logo" loading="lazy" width="40" height="20" decoding="async" data-nimg="1" class="" style="color:transparent" src="{{ asset('public/img/pocket-cfo/logo.svg') }}">
            <p class="text-2xl font-extrabold">PocketCFO</p>
         </a>
         <ul class="flex gap-4 ml-2 ">
            <li class="">
               <div class="group/z cursor-pointer">
                  <div class='group-hover/z:h-[30vh]  fixed top-10 left-0 w-full  h-0 overflow-hidden   transition-all duration-500 z-10 bg-white '>

                     <div class="border-t bg-white">
                        <div class="max-w-7xl mx-auto my-10 p-2 lg:p-6">
                           <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5">
                              @foreach(config('static-data.tools') as $tool)
                              <div>
                                 <p class="text-sm ml-2 mb-2 text-gray-400"> {{$tool['title'] }}</p>
                                 @foreach($tool['tools'] as $subTool)
                                 <a class="gap-1 flex cursor-pointer items-center hover:bg-red-600 justify-start p-2 rounded-sm group" href="/home/tools/{{$tool['category']}}/{{$subTool['page']['url']}}">
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


                  </div>
                  <div class="inline-block text-left">
                     <div>
                        <a class="link flex items-center gap-[2px]">
                           <svg stroke="currentColor" fill="none" stroke-width="0" viewBox="0 0 24 24" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                              <path d="M4 4H8V8H4V4Z" fill="currentColor"></path>
                              <path d="M4 10H8V14H4V10Z" fill="currentColor"></path>
                              <path d="M8 16H4V20H8V16Z" fill="currentColor"></path>
                              <path d="M10 4H14V8H10V4Z" fill="currentColor"></path>
                              <path d="M14 10H10V14H14V10Z" fill="currentColor"></path>
                              <path d="M10 16H14V20H10V16Z" fill="currentColor"></path>
                              <path d="M20 4H16V8H20V4Z" fill="currentColor"></path>
                              <path d="M16 10H20V14H16V10Z" fill="currentColor"></path>
                              <path d="M20 16H16V20H20V16Z" fill="currentColor"></path>
                           </svg>
                           <p class=" hidden sm:block">Tools</p>
                        </a>
                     </div>
                  </div>
               </div>
            </li>
         </ul>
      </div>
      <div class="flex gap-6 ml-6 items-center">
         <ul class="hidden md:flex items-center gap-4 border-l pl-4"><a class="link" href="/login">Login</a><a class=" bg-blue-600 text-white px-4 py-2 font-semibold rounded-sm cursor-pointer text-sm whitespace-nowrap" href="/login">Free Trial</a></ul>
         <ul class="hidden sm:flex items-center gap-6  ">
            <a class="link" href="/pricing">Pricing</a>
            <li class="link">Teams</li>
         </ul>
         <button class="md:hidden">
            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 20 20" aria-hidden="true" height="28" width="28" xmlns="http://www.w3.org/2000/svg">
               <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path>
            </svg>
         </button>
      </div>
   </div>
</nav>