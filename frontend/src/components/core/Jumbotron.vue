<template>
  <div>
    <!-- <v-img
      lazy-src="https://picsum.photos/id/11/10/6"
      max-height="150"
      max-width="250"
      src="http://localhost:4001/api/image/1.jpg"
    ></v-img> -->
    <v-sheet
      :height="$vuetify.breakpoint.smAndUp ? '90vh' : '100vh'"
      color="primary"
      tile
    >
      <v-img
        :key="image"
        :src="image"
        gradient="to top, rgba(160, 90, 70, .3), rgba(30, 40, 30, .85)"
        height="100%"
      >
        <v-container fill-height white--text>
          <v-row
            ><v-col align="center" justify="center">
              <h1
                :class="$vuetify.breakpoint.smAndUp ? 'display-3' : 'display-2'"
                v-text="title"
              />
              <div class="title font-weight-light" v-text="subtitle" />
              <v-btn
                class="align-self-end white--text mt-5"
                fab
                outlined
                @click="$vuetify.goTo('#get_train')"
              >
                <v-icon color="white">mdi-chevron-double-down</v-icon>
              </v-btn></v-col
            ></v-row
          >
        </v-container>
      </v-img>
    </v-sheet>
  </div>
</template>

<script>
export default {
  data: () => ({}),

  computed: {
    namespace() {
      if (!this.$route || !this.$route.name) return "";

      return this.$route.name.toLowerCase();
    },
    image() {
      // return "https://3dnews.ru/assets/external/illustrations/2020/10/25/1023765/01.jpg";
      // return "04.jpg";
      return "http://localhost:4001/api/image/9.jpg";
      // return require("@/assets/9.jpg");
    },
    subtitle() {
      return "Чем мы занимаемся? Смотри ниже :)";
    },
    title() {
      return "Прокат мотоциклов эндуро в Москве!";
    },
  },
};
</script>
