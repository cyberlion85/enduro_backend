<template>
  <v-app>
    <core-app-bar />

    <core-drawer />

    <core-jumbotron />

    <core-view />

    <core-footer />
  </v-app>
</template>

<script>
export default {
  metaInfo: {
    titleTemplate: "%s — Alpha Construction"
  },

  components: {
    CoreDrawer: () => import("@/components/core/Drawer"),
    CoreFooter: () => import("@/components/core/Footer"),
    CoreJumbotron: () => import("@/components/core/Jumbotron"),
    CoreAppBar: () => import("@/components/core/AppBar"),
    CoreView: () => import("@/components/core/View")
  }
};
</script>
