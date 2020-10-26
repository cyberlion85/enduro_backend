<template>
  <v-main class="py-5">
    <router-view />
  </v-main>
</template>

<script>
export default {
  metaInfo() {
    return {
      titleTemplate: "%s — Alpha Theme",
    };
  },

  watch: {
    // eslint-disable-next-line space-before-function-paren
    $route: function () {
      this.$nextTick(() => this.$vuetify.goTo(0));
    },
  },
};
</script>
