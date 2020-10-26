<template>
  <section id="get_train">
    <v-alert class="mt-n5" color="primary" dark dense tile>
      <v-container py-0>
        <v-row align="center" justify="center">
          <v-col class="grow hidden-sm-and-down">
            <h2 class="title font-weight-light">
              Эндуро тренировки и прокат в Москве и Подмосковье
            </h2>
          </v-col>
          <v-col class="shrink">
            <v-btn outlined @click="order = true">
              Записаться на тренировку

              <div v-if="order">
                <order-form v-on:destroy="order = false"></order-form>
              </div>
            </v-btn>
          </v-col>
        </v-row>
      </v-container>
    </v-alert>
  </section>
</template>
<script>
export default {
  data: () => ({
    order: false,
  }),
  components: {
    OrderForm: () => import("@/components/OrderForm"),
  },
};
</script>
