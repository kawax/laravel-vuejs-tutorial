<template>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
           aria-haspopup="true" aria-expanded="false">
            通知 <span class="badge badge-pill badge-primary">{{ notifications.length }}</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" v-for="notification in notifications">{{ notification.message }}</a>
        </div>
    </li>
</template>

<script>
    export default {
        data () {
            return {
                notifications: [],
            }
        },
        mounted () {
            this.getNotifications()
        },
        methods: {
            async getNotifications () {
                const res = await axios.get('/api/notifications')
                if (res.status === 200) {
                    this.notifications = res.data
                }
            },
        },
    }
</script>
