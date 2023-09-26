<template>
    <div class="fixed bottom-16  md:left-20 lg:left-40 w-full  ">
        <div class='px-8 relative max-w-4xl mx-auto p-4  '>
            <span class="material-icons text-gray-400 ml-2 text-2xl absolute mt-4">add_circle</span>
            <input class='inp' placeholder='Send a message' />
        </div>
    </div>
</template>


<script>
export default {
    methods: {}

}
</script>


<style scoped>
.inp {
    @apply placeholder-purple-500 shadow rounded-md p-4 w-full outline-none duration-300 transition-all ring-0 focus:ring-2 ring-purple-500 pl-8
}
</style>


