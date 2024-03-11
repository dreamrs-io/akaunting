<x-layouts.landing>
    <x-slot name="title">
        Pocket | CFO
    </x-slot>
    <x-slot name="content">

    <div class="mb-20">
   <div class="container mx-auto">
      <h1 class=" text-5xl text-center my-10 max-w-2xl mx-auto line-clamp-2">Convert Balance Sheet to Tax Returns Using Pocket CFO</h1>
      <div class="bg-blue-600 rounded-md text-center p-20 max-w-6xl mx-auto relative ">
         <div class="flex justify-center mb-4">
            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 384 512" class="text-center text-white" height="32" width="32" xmlns="http://www.w3.org/2000/svg">
               <path d="M369.9 97.9L286 14C277 5 264.8-.1 252.1-.1H48C21.5 0 0 21.5 0 48v416c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48V131.9c0-12.7-5.1-25-14.1-34zM332.1 128H256V51.9l76.1 76.1zM48 464V48h160v104c0 13.3 10.7 24 24 24h104v288H48zm250.2-143.7c-12.2-12-47-8.7-64.4-6.5-17.2-10.5-28.7-25-36.8-46.3 3.9-16.1 10.1-40.6 5.4-56-4.2-26.2-37.8-23.6-42.6-5.9-4.4 16.1-.4 38.5 7 67.1-10 23.9-24.9 56-35.4 74.4-20 10.3-47 26.2-51 46.2-3.3 15.8 26 55.2 76.1-31.2 22.4-7.4 46.8-16.5 68.4-20.1 18.9 10.2 41 17 55.8 17 25.5 0 28-28.2 17.5-38.7zm-198.1 77.8c5.1-13.7 24.5-29.5 30.4-35-19 30.3-30.4 35.7-30.4 35zm81.6-190.6c7.4 0 6.7 32.1 1.8 40.8-4.4-13.9-4.3-40.8-1.8-40.8zm-24.4 136.6c9.7-16.9 18-37 24.7-54.7 8.3 15.1 18.9 27.2 30.1 35.5-20.8 4.3-38.9 13.1-54.8 19.2zm131.6-5s-5 6-37.3-7.8c35.1-2.6 40.9 5.4 37.3 7.8z"></path>
            </svg>
         </div>
         <div class="mb-2 text-white"></div>
         <!-- <input type="file" class="hidden" id="fileInput" accept=".jpg, .jpeg, .png, .doc, .pdf" onchange="showFileContent()"> -->
         <input type="file" id="fileInput" onchange="showFileContent()">
         <button class="bg-white p-2 px-6 rounded-md font-light ">
            <div class="flex items-center gap-2"><span>Choose File</span></div>
         </button>
         <label class="block font-semibold my-2 text-white">or drop File here</label><label class="block font-semibold my-2 text-white"></label>
         <div class="inset-2 border-2 border-white border-dashed rounded-md absolute pointer-events-none"></div>
         <div class="text-white mt-4"></div> <div id="fileContent"></div>
      </div>
   </div>
</div>


      
    </x-slot>
</x-layouts.landing>

<script>

function showFileContent() {
        const fileInput = document.getElementById('fileInput');
        const fileContent = document.getElementById('fileContent');

        const file = fileInput.files[0];

        if (file) {
            const reader = new FileReader();

            reader.onload = function (e) {
                fileContent.textContent = e.target.result;
            };

            reader.readAsText(file);
        }
    }



</script>