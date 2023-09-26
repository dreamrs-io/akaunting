<template>
    <div class="fixed bottom-16  md:left-20 lg:left-40 w-full  ">
        <div class='px-8 relative max-w-4xl mx-auto p-4   '>
            <span class="material-icons text-gray-400 ml-3 text-2xl absolute mt-4">add_circle</span>
            <input class='inp shad' placeholder='Send a message' />
        </div>
    </div>
</template>


<script>
export default {
    methods: {}
}
</script>


<style scoped>

.shad{

    box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;
}


.inp {
    @apply placeholder-purple-500 rounded-md p-4 w-full outline-none duration-300 transition-all ring-0 focus:ring-2 ring-purple-500 pl-10 shad
}


</style>