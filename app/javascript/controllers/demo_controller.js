import { auto } from "@popperjs/core";

async function autofill(field, value) {
  document.querySelector(field).value = value;
  await new Promise(resolve => setTimeout(resolve, 300));
}

document.addEventListener("turbo:load", () => {
  const dog_name = document.querySelector("#dog_name");
  if (document.body.dataset.demo && dog_name) {
    dog_name.addEventListener("focus", async (e) => {
      await autofill("#dog_name", "Nai cha");
      await autofill("#dog_age", "1m");
      await autofill("#dog_gender", "female");
      await autofill("#dog_sex_orientation", "heterosexual");
      await autofill("#dog_short_description", "Es muy cute");
      await autofill("#dog_hobbies", "Play with ball");
      await autofill("#dog_personality", "playful");
      await autofill("#dog_address", "Dammweg 6 8134 Zürich");
      await autofill("#dog_training_status", "trained");
      await autofill("#dog_breed", "American Cocker Spaniel");

    });


  }
});
