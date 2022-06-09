import { auto } from "@popperjs/core";

async function autofill(field, value) {
  document.querySelector(field).value = value;
  await new Promise(resolve => setTimeout(resolve, 300));
}

document.addEventListener("turbo:load", () => {
  const dog_name = document.querySelector("#dog_name");
  if (document.body.dataset.demo && dog_name) {
    dog_name.addEventListener("focus", async (e) => {
      await autofill("#dog_name", "Bruce");
      await autofill("#dog_age", "3");
      await autofill("#dog_gender", "male");
      await autofill("#dog_sex_orientation", "homosexual");
      await autofill("#dog_short_description", "I am shy, but I want to make friends!");
      await autofill("#dog_hobbies", "Play in the mud!");
      await autofill("#dog_personality", "playful");
      await autofill("#dog_address", "Rennweg 57 8134 Zürich");
      await autofill("#dog_training_status", "in training");
      await autofill("#dog_has_breed_certificate", false);
      await autofill("#dog_breed", "Mix");

    });


  }
});
