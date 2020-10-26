<template>
  <v-app-bar
    id="home"
    v-scroll="onScroll"
    :color="!isScrolling ? 'transparent' : 'rgba(255, 109, 0, 1)'"
    :hide-on-scroll="$vuetify.breakpoint.smAndDown"
    app
    dark
    elevate-on-scroll
  >
    <v-img
      alt="Alpha Construction"
      class="shrink"
      max-width="100"
      src="/static/enduro/logo_invert.png"
    />
    <v-spacer />
    <v-toolbar-items v-if="$vuetify.breakpoint.mdAndUp">
      <v-btn
        v-for="(item, i) in items"
        :key="i"
        :active-class="!isScrolling ? 'primary--text' : undefined"
        text
        @click="$vuetify.goTo(item.to)"
      >
        <span v-text="item.text" />
      </v-btn>
    </v-toolbar-items>
    <v-app-bar-nav-icon
      v-else
      aria-label="Open Navigation Drawer"
      @click="toggleDrawer"
    />
  </v-app-bar>
</template>

<script>
// Utilities
import { mapMutations } from "vuex";

export default {
  data: () => ({
    isScrolling: false,
  }),

  computed: {
    items() {
      return [
        { to: "#home", text: "Домой" },
        {
          to: "#about-us",
          text: "О нас",
        },
        {
          to: "#bikes",
          text: "Техника",
        },
        {
          to: "#cost",
          text: "Цены",
        },
        {
          to: "#rent",
          text: "Услуги",
        },
        {
          to: "#contacts",
          text: "Контакты",
        },
      ];
    },
  },

  methods: {
    ...mapMutations(["toggleDrawer"]),
    onScroll() {
      this.isScrolling =
        (window.pageYOffset || document.documentElement.scrollTop || 0) > 25;
    },
  },
};
</script>
