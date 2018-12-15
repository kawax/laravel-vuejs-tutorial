<template>
    <button type="button" class="btn btn-primary" @click="send">Send Notification</button>
</template>

<script>
    export default {
        methods: {
            send () {
                const res = axios.post('/api/send')
            },
        },
    }
</script>
