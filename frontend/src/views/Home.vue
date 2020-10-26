<template>
  <div id="home">
    <get-a-quote />

    <section id="about-us">
      <div class="py-4"></div>

      <v-container class="text-center">
        <h2 class="display-2 font-weight-bold mb-3">ПРО НАС</h2>

        <v-responsive class="mx-auto mb-8" width="56"> </v-responsive>
        <v-avatar class="elevation-12 mb-12" size="128">
          <v-img src="/static/enduro/6.jpg"></v-img>
        </v-avatar>
        <v-responsive
          class="mx-auto title font-weight-light mb-8"
          max-width="720"
        >
          Мы больные Enduro люди. Мы ну очень любим мотоциклы и мы хотим
          показать тебе все прелести покатушек на эндуро. Мы используем
          мотоциклы класса эндуро для перемещения там, где сложно пройти даже
          пешком! Эндуро – агрессивный вид езды, гонка на выносливость. И с
          каждым разом мы усложняем себе маршруты и ищем новые препятствия. Мы
          прокладываем новые маршруты, где возможно и, казалось бы, невозможно
          проехать на мотоцикле. Ты забыл, что такое адреналин? Хочешь испытать
          его прилив? Предлагаем покататься на мотоцикле эндуро! Мы поможем тебе
          вспомнить это ощущение, когда кровь пульсирует по всему телу, а сердце
          будто вот-вот выпрыгнет из груди!
          <v-divider class="mb-1"></v-divider>

          <v-divider></v-divider>
        </v-responsive>
      </v-container>

      <div class="py-12"></div>
    </section>

    <section id="photos">
      <div><photos /></div>
    </section>

    <!-- <v-container>
      <v-row>
        <v-col align="center">
          <v-card max-width="460" min-width="300">
            <v-card-text align="left">
              <div class="text--primary">
                <v-icon medium color="green darken-2">mdi-check</v-icon>
                Хочешь покататься на мотоцикле? Тебе к нам!
              </div>
              <div class="text--primary">
                <v-icon medium color="green darken-2">mdi-check</v-icon>
                Никогда не катался на эндуро? Тебе к нам!
              </div>
              <div class="text--primary">
                <v-icon medium color="green darken-2">mdi-check</v-icon>
                Ты закончил мотошколу, но нет практики? Тебе к нам!
              </div>
              <div class="text--primary">
                <v-icon medium color="green darken-2">mdi-check</v-icon>
                Выбираешь мотоцикл, но ещё не определился? Тебе к нам!
              </div>
              <div class="text--primary">
                <v-icon medium color="green darken-2">mdi-check</v-icon>
                Выбираешь мотоцикл, но ещё не определился? Тебе к нам!
              </div>
              <br />

              <p class="title text--primary">
                Все, что связано с Soft Enduro – к нам!
              </p>
              <hr />
            </v-card-text>
            <v-card-actions>
              <v-btn text color="deep-purple accent-4 ">Смотри еще</v-btn>
            </v-card-actions>
          </v-card>
        </v-col>

        <v-col align="center">
          <iframe
            width="460"
            height="270"
            src="https://www.youtube.com/embed/44U8JCIx65s"
            frameborder="20"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen
          ></iframe>
        </v-col>
      </v-row>
      <v-divider class="mb-1"></v-divider>

      <v-divider></v-divider>
    </v-container> -->

    <section id="welcome">
      <v-container :pt-5="$vuetify.breakpoint.mdAndUp" px-0 pb-0>
        <v-row>
          <v-col v-for="(feature, i) in features" :key="i" cols="12" md="6">
            <v-row
              class="pa-0 ma-0 text-center text-sm-left"
              justify="center"
              tag="section"
            >
              <v-col class="text-sm-right">
                <v-icon
                  :color="feature.color"
                  size="56"
                  v-text="feature.icon"
                />
              </v-col>
              <v-col cols="12" sm="10" md="8">
                <h3
                  class="title font-weight-regular mb-3 mt-2"
                  v-text="feature.header"
                />
                <p class="body-1 font-weight-light" v-text="feature.text" />
              </v-col>
            </v-row>
          </v-col>
        </v-row>
      </v-container>
    </section>

    <section id="demo" class="py-5 primary white--text mb-n5">
      <v-container>
        <v-row align="center" class="text-md-left text-center" justify="center">
          <h3 class="headline font-weight-light">
            Хочешь испытать себя сейчас?
          </h3>

          <v-spacer class="hidden-sm-and-down" />

          <v-btn
            class="my-3"
            large
            min-width="128"
            rel="noopener"
            rounded
            @click="order = true"
          >
            Записаться на тренировку
          </v-btn>
          <div v-if="order">
            <order-form v-on:destroy="order = false"></order-form>
          </div>
        </v-row>
      </v-container>
    </section>

    <section id="bikes" class="grey lighten-4 px-3">
      <v-container
        :mt-5="$vuetify.breakpoint.mdAndUp"
        :pt-5="$vuetify.breakpoint.mdAndUp"
        px-0
        pb-0
      >
        <v-row
          v-for="(feature, i) in bikes"
          :key="i"
          :class="[$vuetify.breakpoint.mdAndUp && 'my-5']"
          align="center"
          :style="{
            flexDirection:
              $vuetify.breakpoint.mdAndUp && i % 2 ? 'row-reverse' : 'row',
          }"
        >
          <v-col cols="12" md="6">
            <v-sheet max-width="400" class="mx-auto">
              <v-img
                gradient="to right, rgba(160, 90, 70, .05), rgba(30, 40, 30, .1)"
                width="100%"
                height="300"
                color="grey"
                :src="feature.src"
              />
            </v-sheet>
          </v-col>
          <v-col cols="12" md="6">
            <h3
              class="headline font-weight-regular mb-3 mt-2"
              v-text="feature.header"
            />
            <p class="body-1 font-weight-light" v-text="feature.text" />
          </v-col>
          <v-col
            v-if="i !== bikes.length - 1"
            cols="12"
            class="py-5 hidden-sm-and-down"
            order-xs="4"
          >
            <v-divider />
          </v-col>
        </v-row>
      </v-container>
    </section>

    <section id="cost">
      <v-container>
        <v-row align="center">
          <v-col v-for="(plan, i) in plans" :key="i" align="center">
            <v-card
              max-width="350"
              min-width="300"
              :elevation="i === 1 ? 12 : 0"
              :outlined="i !== 1"
              class="v-card--plan text-center pb-3"
            >
              <v-toolbar color="grey lighten-5" flat>
                <v-spacer />
                <div v-text="plan.name" />
                <v-spacer />
              </v-toolbar>

              <v-row>
                <v-col cols="12" class="v-card--plan__price pa-5">
                  <div
                    :class="i === 1 ? 'success--text' : ''"
                    class="d-inline-block"
                  >
                    <span
                      class="display-3 font-weight-bold"
                      v-text="plan.monthly"
                    />
                  </div>
                </v-col>
              </v-row>
              <v-card-text class="mb-4">
                <div
                  v-for="(feature, j) in plan.features"
                  :key="j"
                  v-text="feature"
                />
              </v-card-text>
              <v-card-text>
                <!-- <v-btn :color="i === 1 ? 'success' : 'primary'" depressed tile>
                  Заказать
                </v-btn> -->
                <v-btn @click="order = true" color="success">text</v-btn>
                <div v-if="order">
                  <order-form v-on:destroy="order = false"></order-form>
                </div>
                <div></div>
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </section>
    <section id="rent" class="grey lighten-4 px-3">
      <v-container
        :mt-5="$vuetify.breakpoint.mdAndUp"
        :pt-5="$vuetify.breakpoint.mdAndUp"
        px-0
        pb-0
      >
        <v-row :class="[$vuetify.breakpoint.mdAndUp && 'my-5']" align="center">
          <v-col cols="12" md="6">
            <v-sheet elevation="14" max-width="500" class="mx-auto">
              <v-img
                src="static/enduro/5.jpg"
                gradient="to right, rgba(160, 90, 70, .05), rgba(30, 40,
              30, .1)"
                width="100%"
                height="300"
                color="grey"
              /><v-card color="grey lighten-4">
                <v-card-text class="mb-4">
                  <h4>В стоимость проката входит:</h4>
                  <ul>
                    <li>аренда мотоцикла</li>
                    <li>защита (шлем, черепаха, мотоботы, колени, перчатки)</li>
                    <li>бензин</li>
                    <li>сопровождение инструктором</li>
                  </ul>
                </v-card-text>
              </v-card>
            </v-sheet>
          </v-col>
          <v-col cols="12" md="6">
            <v-sheet max-width="500" class="mx-auto grey lighten-4 px-3">
              <h1 class="display-1 mb-4">ПРОКАТ МОТОЦИКЛОВ</h1>

              <h4 class="subheading">
                Не знаешь как провести свободное время?
              </h4>
              <h4 class="subheading">
                Проведи его с друзьями! Собирай компанию и приезжай на покатухи
                эндуро.
              </h4>
              <h4 class="subheading">
                Вы можете взять в аренду мотоцикл enduro, и поехать со мной.
                Одновременно с собой я могу взять до 4 человек (каждому выдаю в
                прокат индивидуальный мотоцикл). Во время поездки на мотоцикле
                мы будем проезжать лесной участок, поля, Enduro площадку.
              </h4>
            </v-sheet>
          </v-col>
        </v-row>
      </v-container>
    </section>
    <section id="school" class="grey lighten-2 px-3 mt-n5">
      <v-container
        :mt-5="$vuetify.breakpoint.mdAndUp"
        :pt-5="$vuetify.breakpoint.mdAndUp"
        px-0
        pb-0
      >
        <v-row :class="[$vuetify.breakpoint.mdAndUp && 'my-5']" align="center">
          <v-col cols="12" md="6">
            <v-sheet max-width="500" class="mx-auto grey lighten-2 px-3">
              <h1 class="display-1">ОБУЧЕНИЕ ВОЖДЕНИЮ</h1>
              <h1 class="display-1 mb-4">ЭНДУРО ШКОЛА</h1>
              <h3 class="subheading">
                Вы никогда не пробовали Enduro? Вы никогда не сидели за рулем
                мотоцикла? Пришло время попробовать!
              </h3>
              <h4 text-indent="20" class="subheading text-indent-20">
                Наша профессиональная эндуро школа предлагает обучение мастерами
                езде на мотоциклах эндуро, гонке на выносливость.
              </h4>
              <h4 class="subheading">
                Опытный мотоинструктор сможет Вас научить не только азам, но и
                продвинутым навыкам вождения и владения агрессивным мотобайком.
              </h4>
              <h4 class="subheading">
                Джарвиса, пожалуй, мы из Вас не сделаем, но это будет первый шаг
                к освоению Enduro дисциплины.
              </h4>
              <h4 class="subheading mb-6">
                Мы найдём общий язык именно с тобой! Наша школа эндуро в Москве
                открыта для всех желающих обучиться мотоцикла эндуро.
              </h4>
            </v-sheet>
          </v-col>
          <v-col cols="12" md="6">
            <v-sheet elevation="14" max-width="500" class="mx-auto">
              <v-img
                src="static/enduro/learning.jpg"
                gradient="to right, rgba(160, 90, 70, .05), rgba(30, 40,
              30, .1)"
                width="100%"
                height="300"
                color="grey"
              />
            </v-sheet>
          </v-col>
        </v-row>
      </v-container>
    </section>

    <section id="contacts" class="px-3 mt-n1">
      <v-container
        :mt-5="$vuetify.breakpoint.mdAndUp"
        :pt-5="$vuetify.breakpoint.mdAndUp"
        px-0
        pb-0
      >
        <v-row :class="[$vuetify.breakpoint.mdAndUp && 'my-5']" align="center">
          <v-col>
            <v-card elevation="0" max-width="400">
              <v-card-text>
                <h1 class="mb-10">Площадка в Москве:</h1>
                <div class="mb-5">
                  <v-icon class="mr-4" large color="green darken-2"
                    >mdi-map-marker-outline</v-icon
                  >
                  Москва,ул. Лобачевского, 130, ст.6
                </div>
                <v-divider class="mb-5"></v-divider>
                <div class="mb-5">
                  <v-icon class="mr-4" large color="green darken-2"
                    >mdi-cellphone</v-icon
                  >
                  +7 (985) 995 17 50
                </div>
                <v-divider class="mb-5"></v-divider>
                <div class="mb-5">
                  <v-icon class="mr-4" large color="green darken-2"
                    >mdi-email</v-icon
                  >
                  hochuikachu@yandex.ru
                </div>
              </v-card-text>

              <div color="black" v-click-outside="hide" @click="toggle">
                <v-row justify="center">
                  <v-dialog v-model="dialog" persistent max-width="600">
                    <template v-slot:activator="{ on, attrs }">
                      <v-btn
                        outlined
                        color="primary"
                        dark
                        v-bind="attrs"
                        v-on="on"
                      >
                        <v-icon dark left> mdi-map-marker-outline </v-icon>
                        Показать карту
                      </v-btn>
                    </template>
                    <v-card>
                      <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2248.2697945827426!2d37.475383216031084!3d55.701682003400954!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46b54c3a7baaef9b%3A0x775542c9eeda3697!2z0YPQuy4g0JvQvtCx0LDRh9C10LLRgdC60L7Qs9C-LCAxMzAg0YHRgtGA0L7QtdC90LjQtSA2LCDQnNC-0YHQutCy0LAsIDExOTUwMQ!5e0!3m2!1sru!2sru!4v1602880015564!5m2!1sru!2sru"
                        width="600"
                        height="500"
                        frameborder="0"
                        style="border: 0"
                        allowfullscreen=""
                        aria-hidden="false"
                        tabindex="0"
                      ></iframe>
                      <v-card-actions color="black">
                        <v-spacer></v-spacer>

                        <v-btn color="error" @click="dialog = !dialog">
                          Закрыть
                        </v-btn>
                      </v-card-actions>
                    </v-card>
                  </v-dialog>
                </v-row>
              </div>
            </v-card></v-col
          >
          <v-col>
            <v-card elevation="0" max-width="400">
              <v-card-text>
                <h1 class="mb-10">Площадка в подмосковье:</h1>
                <div class="mb-5">
                  <v-icon class="mr-4" large color="green darken-2"
                    >mdi-map-marker-outline</v-icon
                  >
                  Москва, д. Яковлево, ул. Школьная, 3Ас1
                </div>
                <v-divider class="mb-5"></v-divider>
                <div class="mb-5">
                  <v-icon class="mr-4" large color="green darken-2"
                    >mdi-cellphone</v-icon
                  >
                  +7 (985) 995 17 50
                </div>
                <v-divider class="mb-5"></v-divider>
                <div class="mb-5">
                  <v-icon class="mr-4" large color="green darken-2"
                    >mdi-email</v-icon
                  >
                  hochuikachu@yandex.ru
                </div>
              </v-card-text>

              <div v-click-outside="hide" @click="toggle">
                <v-row justify="center">
                  <v-dialog
                    v-model="map_podmosckovie"
                    persistent
                    max-width="600"
                  >
                    <template v-slot:activator="{ on, attrs }">
                      <v-btn
                        outlined
                        color="primary"
                        dark
                        v-bind="attrs"
                        v-on="on"
                      >
                        <v-icon dark left> mdi-map-marker-outline </v-icon>
                        Показать карту
                      </v-btn>
                    </template>
                    <v-card>
                      <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2260.9700377846734!2d37.401630316024466!3d55.48062002041855!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x414aab483df719fb%3A0x5192cc63b07f2e9d!2z0J_RgNC-0LrQsNGCINGN0L3QtNGD0YDQviDQvNC-0YLQu9GG0LjQutC70L7Qsi4g0JrQsNGH0YMg0LrRg9C00LAg0YXQvtGH0YM!5e0!3m2!1sru!2sru!4v1602953106843!5m2!1sru!2sru"
                        width="600"
                        height="500"
                        frameborder="0"
                        style="border: 0"
                        allowfullscreen=""
                        aria-hidden="false"
                        tabindex="0"
                      ></iframe>
                      <v-card-actions>
                        <v-spacer></v-spacer>

                        <v-btn
                          color="error"
                          @click="map_podmosckovie = !map_podmosckovie"
                        >
                          Закрыть
                        </v-btn>
                      </v-card-actions>
                    </v-card>
                  </v-dialog>
                </v-row>
              </div>
            </v-card></v-col
          >
        </v-row>
      </v-container>
    </section>
  </div>
</template>

<script>
import ClickOutside from "vue-click-outside";
export default {
  metaInfo: {
    title: "Home",
    meta: [
      {
        name: "description",
        content: "Customized vue-cli templates for Vue and Vuetify",
      },
    ],
  },

  components: {
    GetAQuote: () => import("@/components/GetAQuote"),
    OrderForm: () => import("@/components/OrderForm"),
    Photos: () => import("@/components/core/Photos"),
  },

  data: () => ({
    order: false,
    opened: false,
    dialog: false,
    prokat: [],
    map_lobachevsk: false,
    map_podmosckovie: false,
    plans: [
      {
        name: "2 ЧАСА ПОЕЗДКИ",
        monthly: 4000,
        features: ["По выходным и будням", "Группа до 4х человек"],
      },
      {
        name: "КУРС ОБУЧЕНИЯ",
        monthly: 17500,
        features: [
          "ежедневно ",
          "5 занятий по 2 часа (10 часов)",
          "в группе до 2 человек",
        ],
      },
    ],
    features: [
      {
        icon: "mdi-account-cog",
        color: "blue-grey",
        header: "Индивидуальный подход",
        text:
          "К нашим клиентам мы относимся с заботой и ценим Ваше доверие. Берём в расчёт Ваши пожелания, находим подход к каждому.",
      },
      {
        icon: "mdi-alert-rhombus",
        color: "green",
        header: "Только безопасные покатушки!",
        text:
          "Обязательно выдаём на время покатушек защитную экипировку – шлем, черепаха, мотоботы, наколенники, перчатки.",
      },
      {
        icon: "mdi-school",
        color: "indigo",
        header: "Эндуро школа",
        text:
          "Обучаем правильному управлению мотоциклом даже тех, кто вовсе не имеет опыта покатух (езды на мотоциклах эндуро).",
      },
      {
        icon: "mdi-eye",
        color: "blue lighten-1",
        header: "Сопровождение в поездке",
        text:
          "Чтобы помочь Вам пройти даже самые сложные участки пути, все поездки на мотоциклах проходят в сопровождении инструкторов.",
      },
      {
        icon: "mdi-currency-usd",
        color: "teal",
        header: "Цена/качество",
        text: "Мы предлагаем прокат полноценных мотоциклов по цене питбайков.",
      },
    ],
    items: [
      {
        src: "/static/enduro/2.jpg",
      },
      {
        src: "/static/enduro/6.jpg",
      },
      {
        src: "/static/enduro/3.jpg",
      },
      {
        src: "/static/enduro/8.jpg",
      },
      {
        src: "/static/enduro/9.jpg",
      },
    ],

    bikes: [
      {
        header: "Yamaha serow 225",
        text:
          "Ещё один легендарный японский эндуро. Надёжен, обладает великолепной тягой, простотой в обращении. Прокат этого мотоцикла приходится по вкусу невысоким райдерам и девушкам.",
        src: require("@/assets/9.jpg"),
        // src: "static/enduro/bikes/serow1.jpg",
      },
      {
        header: "BSE J1",
        text:
          "Легкий, быстрый, мощный, надёжный, простой в управлении и эксплуатации кроссовый мотоцикл по доступной цене. BSE J1-250e 21/18 отлично подойдет, как новичкам, только начинающим постигать мир мотокросса и знакомиться с мотоциклом, так и кроссменам с опытом.",
        src: "static/enduro/bikes/bse2.jpg",
      },
      {
        header: "Avantis Enduro 250 (172)",
        text:
          "Шедевр китайского мотостроения. Эндуро Avantis воплотил в себе симбиоз геометрии рамы КТМ, надёжного двигателя и хорошей подвески. Ценный и очень интересный аппарат.",
        src: "static/enduro/bikes/avantis1.jpg",
      },
      {
        header: "Honda xr 250",
        text:
          "Легенда японской мотопромышленности. Этот мотоцикл способен порадовать любого, даже самого изысканного райдера.",
        src: "static/enduro/bikes/hodaxr1.jpg",
      },
    ],
  }),
  methods: {
    toggle() {
      this.opened = true;
    },

    hide() {
      this.opened = false;
      this.dialog = false;
      this.map_podmosckovie = false;
    },
  },

  mounted() {
    // prevent click outside event with popupItem.
    this.popupItem = this.$el;
  },

  // do not forget this section
  directives: {
    ClickOutside,
  },
};
</script>
<style>
h4 {
  text-indent: 1em; /* Отступ первой строки */
  text-align: justify; /* Выравнивание по ширине */
  margin-bottom: 7px; /* Выравнивание по ширине */
}
</style>
