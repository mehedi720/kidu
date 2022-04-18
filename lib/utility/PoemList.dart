Map PoemList = {
  0: "Baa Baa Black Sheep",
  1: "Mary Had A Little Lamb",
  2: "Ringa Ringa Roses",
  3: "Twinkle twinkle little star",
  4: "Jack And Jill",
  5: "Two Little Dicky Birds"
};

Map LyricsList = {
  0: [
    "Baa, baa, black sheep, have you any wool?",
    "Yes, sir, yes, sir, three bags full",
    "One for my master, one for my dame",
    "And one for the little boy who lives down the lane",
    "Baa, baa, black sheep, have you any wool?",
    "Yes, sir, yes, sir, three bags full",
    "Baa, baa, black sheep, have you any wool?",
    "Yes, sir, yes, sir, three bags full",
    "One for my master, one for my dame",
    "And one for the little boy who lives down the lane",
  ],
  1: [
    "Mary had a little lamb",
    "his fleece was white as snow",
    "Ev'rywhere that Mary went",
    "that lamb was sur to go",
    "He followed her to school one day",
    "it was against the rules",
    "Made the children laugh and play to",
    "see a lamb at school"
  ],
  2: [
    "Ring-a-ring o roses",
    "A pocket full of posies",
    "A-tishoo, a-tishoo",
    "We all fall down",
    "Ring-a-ring o roses",
    "A pocket full of posies",
    "A-tishoo, a-tishoo",
    "We all fall down",
  ],
  3: [
    "Twinkle, twinkle, little star",
    "How I wonder what you are",
    "Up above the world so high",
    "Like a diamond in the sky",
    "Twinkle, twinkle, little star",
    "How I wonder what you are",
  ],
  4: [
    "Jack and Jill",
    "Went up the hill",
    "To fetch a pail of water",
    "Jack fell down",
    "And broke his crown",
    "And Jill came tumbling after",
    "Up Jack got",
    "And home did trot",
    "As fast as he could caper",
    "Went to bed",
    "To mend his head",
    "With vinegar and brown paper",
  ],
  5: [
    "Two Little Dicky Birds",
    "Sat upon a wall",
    "One named Peter",
    "The other named Paul",
    "Fly away Peter",
    "Fly away Paul",
    "Come back Peter",
    "Come back Paul",
  ],
};

Map BanglaPoemList = {
  0: "হাট্টিমাটিম টিম",
  1: "খোকন খোকন ডাক পাড়ি",
  2: "ঐ দেখা যায় তাল গাছ",
  3: "মা কথাটি চোট্ট অতি",
  4: "ভোর হোলো দোর খোলো",
  5: "নোটন নোটন পায়রাগুলি"
};

Map BanglaLyricsList = {
  0: [
    "হাট্টিমাটিম টিম",
    "তারা মাঠে পাড়ে ডিম",
    "তাদের খাড়া দুটো শিং",
    "তারা হাট্টিমাটিম টিম।"
  ],
  1: [
    "খোকন খোকন ডাক পাড়ি",
    "খোকন মোদের কার বাড়ি?",
    "আয় রে খোকন ঘরে আয়",
    "দুধ মাখা ভাত কাকে খায়।"
  ],
  2: [
    "ঐ দেখা যায় তাল গাছ",
    "ঐ আমাদের গাঁ।",
    "ঐ খানেতে বাস করে",
    "কানা বগীর ছা।",
    "ও বগী তুই খাস কি?",
    "পানতা ভাত চাস কি?",
    "পানতা আমি খাই না",
    "পুঁটি মাছ পাই না",
    "একটা যদি পাই",
    "অমনি ধরে গাপুস গুপুস খাই।"
  ],
  3: [
    "মা কথাটি চোট্ট অতি"
        "কিন্তু জেনো ভাই",
    "ইহার চেয়ে নাম যে মধুর",
    "তিন ভুবনে নাই।",
    "সত্য ন্যায়ের ধর্ম থাকুক",
    "মাথার ‘পরে আজি",
    "অন্তরে মা থাকুন মম",
    "ঝরুক স্নেহরাজি ।"
  ],
  4: [
    "ভোর হোলো",
    "দোর খোলো",
    "খুকুমণি ওঠ রে !"
        "ঐ ডাকে",
    "জুঁই-শাখে",
    "ফুল-খুকী ছোট রে !"
        "রবি মামা",
    "দেয় হামা",
    "গায়ে রাঙা জামা ঐ",
    "দারোয়ান",
    "গায় গান",
    "শোনো ঐ, ‘রামা হৈ!"
  ],
  5: [
    "নোটন নোটন পায়রাগুলি",
    "ঝোটন বেঁধেছে",
    "ওপারেতে ছেলেমেয়ে",
    "নাইতে নেমেছে।"
        "দুই ধারে দুই রুই কাতলা",
    "ভেসে উঠেছে",
    "কে দেখেছে কে দেখেছে",
    "দাদার হাতে কলম ছিল",
    "ছুড়ে মেরেছে",
    "উঃ বড্ড লেগেছে।"
  ],
};

// {
// 0: "Baa, baa, black sheep, have you any wool?",
// 1: "Yes, sir, yes, sir, three bags full",
// 2: "One for my master, one for my dame",
// 3: "And one for the little boy who lives down the lane"
// },
class Lyrics {
  getLyricsLength(int i) {
    List m = LyricsList[i];
    return m.length;
  }
}

class BanglaLyrics {
  getLyricsLength(int i) {
    List m = BanglaLyricsList[i];
    return m.length;
  }
}
