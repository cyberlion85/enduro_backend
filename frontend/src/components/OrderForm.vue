<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" persistent max-width="400px">
      <!-- <template v-slot:activator="{ on, attrs }">
        <v-btn color="primary" dark v-bind="attrs" v-on="on">
          Open Dialog
        </v-btn>
      </template> -->
      <v-card>
        <v-card-title>
          <span class="headline">Заказать звонок с сайта</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              <v-col cols="12" sm="12" md="12">
                <v-text-field
                  v-model="name"
                  label="Ваше имя*"
                  required
                ></v-text-field>
                <v-text-field
                  v-model="phone"
                  label="Ваш телефон*"
                  required
                ></v-text-field>

                <v-select
                  v-model="selected"
                  :items="['Как можно скорее', 'Утром', 'Днем', 'Вечером']"
                  label="Когда вам удобно получить звонок?*"
                  required
                ></v-select>
              </v-col>
            </v-row>
          </v-container>
          <!-- <small>*indicates required field</small> -->
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text @click="destroyMethod()">
            Закрыть
          </v-btn>
          <v-btn color="blue darken-1" text @click="fetchImages()">
            ОТправить
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>
<script>
import axios from "axios";
export default {
  data: () => ({ name: "", phone: "", selected: "", dialog: false }),
  methods: {
    destroyMethod() {
      console.log("destroyMethod");
      this.dialog = false;
      this.$emit("destroy");
    },
    fetchImages() {
      const data = {
        email: {
          text_body: `Получен запрос с сайта, имя: ${this.name} телефон: ${this.phone} время звонка: ${this.selected}.`,
          description: this.phone,
        },
      };

      var config = {
        method: "post",
        url: "http://84.38.183.216:4000/emails",
        data: data,
      };

      this.dialog = false;
      this.$emit("destroy");

      // eslint-disable-next-line space-before-function-paren
      return axios(config).then(function (response) {
        console.log(JSON.stringify(response.data));
        console.log("ОТПРАВЛЕНО");
      });
    },
  },
  // eslint-disable-next-line space-before-function-paren
  created: function () {
    // console.log("start form");
    this.dialog = true;
  },
  // eslint-disable-next-line space-before-function-paren
  destroyed: function () {
    // console.log("destroyed");
    // this.dialog = true;
  },
};
</script>
