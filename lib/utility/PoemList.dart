Map PoemList = {
  0: "Baa Baa Black Sheep",
  1: "Mary Had A Little Lamb",
  2: "Ringa Ringa Roses",
  3: "Twinkle twinkle little star"
};

Map LyricsList = {
  0: Lyric,
};

List Lyric = [
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
];

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
