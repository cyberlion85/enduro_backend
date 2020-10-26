<template id="photos">
  <div>
    <div v-if="!overlay">
      <v-row>
        <v-col
          v-for="project in projects"
          :key="project.img"
          class="d-flex child-flex"
          cols="4"
        >
          <v-hover>
            <template v-slot="{ hover }">
              <v-card
                :img="`/static/enduro/photos/${project.img}`"
                class="white--text overflow-hidden"
                dark
                height="300"
                hover
                @click="overlayChange()"
              >
              </v-card>
            </template>
          </v-hover>
        </v-col>
      </v-row>
    </div>
    <v-overlay id="carousel" v-if="overlay" fixed opacity=".9">
      <v-btn
        color="transparent"
        depressed
        fab
        fixed
        large
        right
        top
        @click="overlayChange()"
      >
        <v-icon large>mdi-close</v-icon>
      </v-btn>
      <v-carousel height="800">
        <v-carousel-item
          v-for="(project, i) in projects"
          :key="i"
          :src="`/static/enduro/photos/${project.img}`"
          reverse-transition="fade-transition"
          transition="fade-transition"
        ></v-carousel-item>
      </v-carousel>
    </v-overlay>
  </div>
</template>

<script>
export default {
  data: () => ({
    category: null,
    overlay: false,
    categories: [
      {
        text: "All Services",
        filter: null,
      },
      {
        text: "Skyscrapers",
        filter: 1,
      },
      {
        text: "Government",
        filter: 2,
      },
      {
        text: "Customized",
        filter: 3,
      },
    ],
    projects: [
      {
        name: "Project 1",
        img: "p1.jpg",
        categories: [1, 3],
      },
      {
        name: "Project 2",
        img: "p2.jpg",
        categories: [2, 3],
      },
      {
        name: "Project 3",
        img: "p3.jpg",
        categories: [4, 3],
      },
      {
        name: "Project 4",
        img: "p4.jpg",
        categories: [1, 2],
      },
      {
        name: "Project 5",
        img: "p5.jpg",
        categories: [2, 4],
      },
      {
        name: "Project 6",
        img: "p6.jpg",
        categories: [1, 4],
      },
      {
        name: "Project 7",
        img: "p7.jpg",
        categories: [1, 4],
      },
      {
        name: "Project 8",
        img: "p8.jpg",
        categories: [1, 4],
      },
      {
        name: "Project 9",
        img: "p9.jpg",
        categories: [1, 4],
      },
    ],
  }),

  computed: {
    computedProjects() {
      return !this.category
        ? this.projects
        : this.projects.filter((p) => p.categories.includes(this.category));
    },
  },

  methods: {
    select(category) {
      this.category = category.filter;
    },
    checkOverlay(img) {
      let res = 0;
      //   console.log(`'blabla' ${img}`);

      // eslint-disable-next-line space-before-function-paren
      this.projects.forEach(function (item, index) {
        if (item.img == img) {
          res = index;
        }
      });

      return res;
    },
    overlayChange() {
      this.overlay = !this.overlay;
      this.$vuetify.goTo("#photos");
    },
  },
};
</script>

<style scoped>
.gallery-card {
  transform-origin: center center 0;
  transition: 0.3s cubic-bezier(0.25, 0.8, 0.5, 1);
}

.fade-transition-leave,
.fade-transition-leave-active,
.fade-transition-leave-to {
  display: none;
}
</style>
