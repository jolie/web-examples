<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <section>
      <p>This list content is served from Jolie server :)</p>
      <ul>
        <li v-for="(customer, i) in this.customers" :key="i">
          {{ customer.firstName }}
          {{ customer.lastName }}
        </li>
      </ul>
    </section>
  </div>
</template>

<script>
import { getCustomers } from "../api";
import { ref } from "vue";

export default {
  name: "HelloWorld",
  props: {
    msg: String,
  },

  async setup() {
    try {
      const { customers } = await getCustomers();
      const customerRef = ref(customers);
      return { customers: customerRef };
    } catch (e) {
      console.error(e);
    }
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
a {
  color: #42b983;
}
</style>
