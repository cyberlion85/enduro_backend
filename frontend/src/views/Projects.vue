<template>
  <section id="projects" class="pt-5 mb-n5">
    <heading>Our Projects</heading>

    <v-slide-group v-model="model" show-arrows center-active mandatory>
      <v-slide-item
        v-for="(project, i) in projects"
        :key="i"
        v-slot:default="{ active, toggle }"
      >
        <v-card
          :color="active ? 'primary' : 'grey lighten-1'"
          class="ma-3"
          :img="project"
          height="300"
          width="300"
          flat
          @click="toggle"
        >
          <v-fade-transition>
            <v-overlay v-if="active" color="primary" absolute />
          </v-fade-transition>
        </v-card>
      </v-slide-item>
    </v-slide-group>

    <v-expand-transition>
      <v-sheet v-if="model != null" color="grey lighten-4" tile>
        <v-scroll-y-transition mode="out-in">
          <v-container :key="model" py-5 mx-auto>
            <v-row align="center" justify="center" class="fill-height">
              <v-col cols="12" md="6" class="text-left mb-4">
                <h3 class="headline mb-3">Project {{ model + 1 }}</h3>
                <p class="mb-0">
                  Suspendisse feugiat. Nam at tortor in tellus interdum
                  sagittis. Suspendisse potenti. In hac habitasse platea
                  dictumst. Aenean posuere, tortor sed cursus feugiat, nunc
                  augue blandit nunc, eu sollicitudin urna dolor sagittis lacus.
                </p>
              </v-col>
              <v-col cols="12" md="6">
                <v-card elevation="24">
                  <v-img :src="projects[model]" height="300" />
                </v-card>
              </v-col>
            </v-row>
          </v-container>
        </v-scroll-y-transition>
      </v-sheet>
    </v-expand-transition>
  </section>
</template>

<script>
export default {
  metaInfo: {
    title: "Projects",
    meta: [
      {
        name: "description",
        content: "Customized vue-cli templates for Vue and Vuetify",
      },
    ],
  },

  components: {
    Heading: () => import("@/components/Heading"),
  },

  data: () => ({
    model: 0,
    projects: [
      "/static/project1.png",
      "/static/project2.png",
      "/static/project3.png",
      "/static/project4.png",
      "/static/project5.png",
      "/static/project6.png",
      "/static/project7.png",
    ],
  }),
};
</script>

<style lang="sass">
#projects
  .v-slide-group__content
    justify-content: center
</style>
