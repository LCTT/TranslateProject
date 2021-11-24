[#]: subject: "Implement client-side search on your website with this JavaScript tool"
[#]: via: "https://opensource.com/article/21/11/client-side-javascript-search-lunrjs"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Implement client-side search on your website with this JavaScript tool
======
Lunr.js is a great option for providing search functionality on a
website or application.
![magnifying glass for search on a blue background][1]

Search is a must-have for any website or application. A simple search widget can allow users to comb through your entire blog. Or allow customers to browse your inventory. Building a custom photo gallery? Add a search box. Website search functionality is available from a variety of third-party vendors. Or you can take the DIY approach and build the entire backend to answer search API calls.

[Lunr.js][2] works on the client-side through JavaScript. Instead of sending calls to a backend, Lunr looks up search terms in an index built on the client-side itself. This avoids expensive back-and-forth network calls between the browser and your server. There are plenty of tutorials online to showcase Lunr's website search functionality. But you can actually use Lunr.js to search any array of JavaScript objects.

In this how-to, I build a search index for the [top 100 books of all time][3]. After that, I show you how to pre-build the index for faster indexing. I'll also show you how to make the most of Lunr's search options. And finally, I'll show off [findmymastodon.com][4]—a real-world implementation of Lunr.

### Getting started with Lunr.js

Create a new HTML page called `lunr.html`. I use this file throughout this guide. At the top of `lunr.html`, call the main Lunr JS library.


```
`<script src="https://unpkg.com/lunr/lunr.js"></script>`
```

**Note:** You can find the [complete code here][5]

### Loading the dataset

Next, create a variable called `my_big_json`. This variable will contain the JSON-ified string of the main dataset. Define the variable in `lunr.html` within the `<script>` tags.


```
`var my_big_json = '[{"author":"Chinua Achebe","country":"Nigeria","imageLink":"images/things-fall-apart.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Things_Fall_Apart","pages":209,"title":"Things Fall Apart","year":1958},{"author":"Hans Christian Andersen","country":"Denmark","imageLink":"images/fairy-tales.jpg","language":"Danish","link":"https://en.wikipedia.org/wiki/Fairy_Tales_Told_for_Children._First_Collection.","pages":784,"title":"Fairy tales","year":1836},{"author":"Dante Alighieri","country":"Italy","imageLink":"images/the-divine-comedy.jpg","language":"Italian","link":"https://en.wikipedia.org/wiki/Divine_Comedy","pages":928,"title":"The Divine Comedy","year":1315},{"author":"Unknown","country":"Sumer and Akkadian Empire","imageLink":"images/the-epic-of-gilgamesh.jpg","language":"Akkadian","link":"https://en.wikipedia.org/wiki/Epic_of_Gilgamesh","pages":160,"title":"The Epic Of Gilgamesh","year":-1700},{"author":"Unknown","country":"Achaemenid Empire","imageLink":"images/the-book-of-job.jpg","language":"Hebrew","link":"https://en.wikipedia.org/wiki/Book_of_Job","pages":176,"title":"The Book Of Job","year":-600},{"author":"Unknown","country":"India/Iran/Iraq/Egypt/Tajikistan","imageLink":"images/one-thousand-and-one-nights.jpg","language":"Arabic","link":"https://en.wikipedia.org/wiki/One_Thousand_and_One_Nights","pages":288,"title":"One Thousand and One Nights","year":1200},{"author":"Unknown","country":"Iceland","imageLink":"images/njals-saga.jpg","language":"Old Norse","link":"https://en.wikipedia.org/wiki/Nj%C3%A1ls_saga","pages":384,"title":"Njál\u0027s Saga","year":1350},{"author":"Jane Austen","country":"United Kingdom","imageLink":"images/pride-and-prejudice.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Pride_and_Prejudice","pages":226,"title":"Pride and Prejudice","year":1813},{"author":"Honoré de Balzac","country":"France","imageLink":"images/le-pere-goriot.jpg","language":"French","link":"https://en.wikipedia.org/wiki/Le_P%C3%A8re_Goriot","pages":443,"title":"Le Père Goriot","year":1835},{"author":"Samuel Beckett","country":"Republic of Ireland","imageLink":"images/molloy-malone-dies-the-unnamable.jpg","language":"French, English","link":"https://en.wikipedia.org/wiki/Molloy_(novel)","pages":256,"title":"Molloy, Malone Dies, The Unnamable, the trilogy","year":1952},{"author":"Giovanni Boccaccio","country":"Italy","imageLink":"images/the-decameron.jpg","language":"Italian","link":"https://en.wikipedia.org/wiki/The_Decameron","pages":1024,"title":"The Decameron","year":1351},{"author":"Jorge Luis Borges","country":"Argentina","imageLink":"images/ficciones.jpg","language":"Spanish","link":"https://en.wikipedia.org/wiki/Ficciones","pages":224,"title":"Ficciones","year":1965},{"author":"Emily Brontë","country":"United Kingdom","imageLink":"images/wuthering-heights.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Wuthering_Heights","pages":342,"title":"Wuthering Heights","year":1847},{"author":"Albert Camus","country":"Algeria, French Empire","imageLink":"images/l-etranger.jpg","language":"French","link":"https://en.wikipedia.org/wiki/The_Stranger_(novel)","pages":185,"title":"The Stranger","year":1942},{"author":"Paul Celan","country":"Romania, France","imageLink":"images/poems-paul-celan.jpg","language":"German","link":"","pages":320,"title":"Poems","year":1952},{"author":"Louis-Ferdinand Céline","country":"France","imageLink":"images/voyage-au-bout-de-la-nuit.jpg","language":"French","link":"https://en.wikipedia.org/wiki/Journey_to_the_End_of_the_Night","pages":505,"title":"Journey to the End of the Night","year":1932},{"author":"Miguel de Cervantes","country":"Spain","imageLink":"images/don-quijote-de-la-mancha.jpg","language":"Spanish","link":"https://en.wikipedia.org/wiki/Don_Quixote","pages":1056,"title":"Don Quijote De La Mancha","year":1610},{"author":"Geoffrey Chaucer","country":"England","imageLink":"images/the-canterbury-tales.jpg","language":"English","link":"https://en.wikipedia.org/wiki/The_Canterbury_Tales","pages":544,"title":"The Canterbury Tales","year":1450},{"author":"Anton Chekhov","country":"Russia","imageLink":"images/stories-of-anton-chekhov.jpg","language":"Russian","link":"https://en.wikipedia.org/wiki/List_of_short_stories_by_Anton_Chekhov","pages":194,"title":"Stories","year":1886},{"author":"Joseph Conrad","country":"United Kingdom","imageLink":"images/nostromo.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Nostromo","pages":320,"title":"Nostromo","year":1904},{"author":"Charles Dickens","country":"United Kingdom","imageLink":"images/great-expectations.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Great_Expectations","pages":194,"title":"Great Expectations","year":1861},{"author":"Denis Diderot","country":"France","imageLink":"images/jacques-the-fatalist.jpg","language":"French","link":"https://en.wikipedia.org/wiki/Jacques_the_Fatalist","pages":596,"title":"Jacques the Fatalist","year":1796},{"author":"Alfred Döblin","country":"Germany","imageLink":"images/berlin-alexanderplatz.jpg","language":"German","link":"https://en.wikipedia.org/wiki/Berlin_Alexanderplatz","pages":600,"title":"Berlin Alexanderplatz","year":1929},{"author":"Fyodor Dostoevsky","country":"Russia","imageLink":"images/crime-and-punishment.jpg","language":"Russian","link":"https://en.wikipedia.org/wiki/Crime_and_Punishment","pages":551,"title":"Crime and Punishment","year":1866},{"author":"Fyodor Dostoevsky","country":"Russia","imageLink":"images/the-idiot.jpg","language":"Russian","link":"https://en.wikipedia.org/wiki/The_Idiot","pages":656,"title":"The Idiot","year":1869},{"author":"Fyodor Dostoevsky","country":"Russia","imageLink":"images/the-possessed.jpg","language":"Russian","link":"https://en.wikipedia.org/wiki/Demons_(Dostoyevsky_novel)","pages":768,"title":"The Possessed","year":1872},{"author":"Fyodor Dostoevsky","country":"Russia","imageLink":"images/the-brothers-karamazov.jpg","language":"Russian","link":"https://en.wikipedia.org/wiki/The_Brothers_Karamazov","pages":824,"title":"The Brothers Karamazov","year":1880},{"author":"George Eliot","country":"United Kingdom","imageLink":"images/middlemarch.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Middlemarch","pages":800,"title":"Middlemarch","year":1871},{"author":"Ralph Ellison","country":"United States","imageLink":"images/invisible-man.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Invisible_Man","pages":581,"title":"Invisible Man","year":1952},{"author":"Euripides","country":"Greece","imageLink":"images/medea.jpg","language":"Greek","link":"https://en.wikipedia.org/wiki/Medea_(play)","pages":104,"title":"Medea","year":-431},{"author":"William Faulkner","country":"United States","imageLink":"images/absalom-absalom.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Absalom,_Absalom!","pages":313,"title":"Absalom, Absalom!","year":1936},{"author":"William Faulkner","country":"United States","imageLink":"images/the-sound-and-the-fury.jpg","language":"English","link":"https://en.wikipedia.org/wiki/The_Sound_and_the_Fury","pages":326,"title":"The Sound and the Fury","year":1929},{"author":"Gustave Flaubert","country":"France","imageLink":"images/madame-bovary.jpg","language":"French","link":"https://en.wikipedia.org/wiki/Madame_Bovary","pages":528,"title":"Madame Bovary","year":1857},{"author":"Gustave Flaubert","country":"France","imageLink":"images/l-education-sentimentale.jpg","language":"French","link":"https://en.wikipedia.org/wiki/Sentimental_Education","pages":606,"title":"Sentimental Education","year":1869},{"author":"Federico García Lorca","country":"Spain","imageLink":"images/gypsy-ballads.jpg","language":"Spanish","link":"https://en.wikipedia.org/wiki/Gypsy_Ballads","pages":218,"title":"Gypsy Ballads","year":1928},{"author":"Gabriel García Márquez","country":"Colombia","imageLink":"images/one-hundred-years-of-solitude.jpg","language":"Spanish","link":"https://en.wikipedia.org/wiki/One_Hundred_Years_of_Solitude","pages":417,"title":"One Hundred Years of Solitude","year":1967},{"author":"Gabriel García Márquez","country":"Colombia","imageLink":"images/love-in-the-time-of-cholera.jpg","language":"Spanish","link":"https://en.wikipedia.org/wiki/Love_in_the_Time_of_Cholera","pages":368,"title":"Love in the Time of Cholera","year":1985},{"author":"Johann Wolfgang von Goethe","country":"Saxe-Weimar","imageLink":"images/faust.jpg","language":"German","link":"https://en.wikipedia.org/wiki/Goethe%27s_Faust","pages":158,"title":"Faust","year":1832},{"author":"Nikolai Gogol","country":"Russia","imageLink":"images/dead-souls.jpg","language":"Russian","link":"https://en.wikipedia.org/wiki/Dead_Souls","pages":432,"title":"Dead Souls","year":1842},{"author":"Günter Grass","country":"Germany","imageLink":"images/the-tin-drum.jpg","language":"German","link":"https://en.wikipedia.org/wiki/The_Tin_Drum","pages":600,"title":"The Tin Drum","year":1959},{"author":"João Guimarães Rosa","country":"Brazil","imageLink":"images/the-devil-to-pay-in-the-backlands.jpg","language":"Portuguese","link":"https://en.wikipedia.org/wiki/The_Devil_to_Pay_in_the_Backlands","pages":494,"title":"The Devil to Pay in the Backlands","year":1956},{"author":"Knut Hamsun","country":"Norway","imageLink":"images/hunger.jpg","language":"Norwegian","link":"https://en.wikipedia.org/wiki/Hunger_(Hamsun_novel)","pages":176,"title":"Hunger","year":1890},{"author":"Ernest Hemingway","country":"United States","imageLink":"images/the-old-man-and-the-sea.jpg","language":"English","link":"https://en.wikipedia.org/wiki/The_Old_Man_and_the_Sea","pages":128,"title":"The Old Man and the Sea","year":1952},{"author":"Homer","country":"Greece","imageLink":"images/the-iliad-of-homer.jpg","language":"Greek","link":"https://en.wikipedia.org/wiki/Iliad","pages":608,"title":"Iliad","year":-735},{"author":"Homer","country":"Greece","imageLink":"images/the-odyssey-of-homer.jpg","language":"Greek","link":"https://en.wikipedia.org/wiki/Odyssey","pages":374,"title":"Odyssey","year":-800},{"author":"Henrik Ibsen","country":"Norway","imageLink":"images/a-Dolls-house.jpg","language":"Norwegian","link":"https://en.wikipedia.org/wiki/A_Doll%27s_House","pages":68,"title":"A Doll\u0027s House","year":1879},{"author":"James Joyce","country":"Irish Free State","imageLink":"images/ulysses.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Ulysses_(novel)","pages":228,"title":"Ulysses","year":1922},{"author":"Franz Kafka","country":"Czechoslovakia","imageLink":"images/stories-of-franz-kafka.jpg","language":"German","link":"https://en.wikipedia.org/wiki/Franz_Kafka_bibliography#Short_stories","pages":488,"title":"Stories","year":1924},{"author":"Franz Kafka","country":"Czechoslovakia","imageLink":"images/the-trial.jpg","language":"German","link":"https://en.wikipedia.org/wiki/The_Trial","pages":160,"title":"The Trial","year":1925},{"author":"Franz Kafka","country":"Czechoslovakia","imageLink":"images/the-castle.jpg","language":"German","link":"https://en.wikipedia.org/wiki/The_Castle_(novel)","pages":352,"title":"The Castle","year":1926},{"author":"Kālidāsa","country":"India","imageLink":"images/the-recognition-of-shakuntala.jpg","language":"Sanskrit","link":"https://en.wikipedia.org/wiki/Abhij%C3%B1%C4%81na%C5%9B%C4%81kuntalam","pages":147,"title":"The recognition of Shakuntala","year":150},{"author":"Yasunari Kawabata","country":"Japan","imageLink":"images/the-sound-of-the-mountain.jpg","language":"Japanese","link":"https://en.wikipedia.org/wiki/The_Sound_of_the_Mountain","pages":288,"title":"The Sound of the Mountain","year":1954},{"author":"Nikos Kazantzakis","country":"Greece","imageLink":"images/zorba-the-greek.jpg","language":"Greek","link":"https://en.wikipedia.org/wiki/Zorba_the_Greek","pages":368,"title":"Zorba the Greek","year":1946},{"author":"D. H. Lawrence","country":"United Kingdom","imageLink":"images/sons-and-lovers.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Sons_and_Lovers","pages":432,"title":"Sons and Lovers","year":1913},{"author":"Halldór Laxness","country":"Iceland","imageLink":"images/independent-people.jpg","language":"Icelandic","link":"https://en.wikipedia.org/wiki/Independent_People","pages":470,"title":"Independent People","year":1934},{"author":"Giacomo Leopardi","country":"Italy","imageLink":"images/poems-giacomo-leopardi.jpg","language":"Italian","link":"","pages":184,"title":"Poems","year":1818},{"author":"Doris Lessing","country":"United Kingdom","imageLink":"images/the-golden-notebook.jpg","language":"English","link":"https://en.wikipedia.org/wiki/The_Golden_Notebook","pages":688,"title":"The Golden Notebook","year":1962},{"author":"Astrid Lindgren","country":"Sweden","imageLink":"images/pippi-longstocking.jpg","language":"Swedish","link":"https://en.wikipedia.org/wiki/Pippi_Longstocking","pages":160,"title":"Pippi Longstocking","year":1945},{"author":"Lu Xun","country":"China","imageLink":"images/diary-of-a-madman.jpg","language":"Chinese","link":"https://en.wikipedia.org/wiki/A_Madman%27s_Diary","pages":389,"title":"Diary of a Madman","year":1918},{"author":"Naguib Mahfouz","country":"Egypt","imageLink":"images/children-of-gebelawi.jpg","language":"Arabic","link":"https://en.wikipedia.org/wiki/Children_of_Gebelawi","pages":355,"title":"Children of Gebelawi","year":1959},{"author":"Thomas Mann","country":"Germany","imageLink":"images/buddenbrooks.jpg","language":"German","link":"https://en.wikipedia.org/wiki/Buddenbrooks","pages":736,"title":"Buddenbrooks","year":1901},{"author":"Thomas Mann","country":"Germany","imageLink":"images/the-magic-mountain.jpg","language":"German","link":"https://en.wikipedia.org/wiki/The_Magic_Mountain","pages":720,"title":"The Magic Mountain","year":1924},{"author":"Herman Melville","country":"United States","imageLink":"images/moby-dick.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Moby-Dick","pages":378,"title":"Moby Dick","year":1851},{"author":"Michel de Montaigne","country":"France","imageLink":"images/essais.jpg","language":"French","link":"https://en.wikipedia.org/wiki/Essays_(Montaigne)","pages":404,"title":"Essays","year":1595},{"author":"Elsa Morante","country":"Italy","imageLink":"images/history.jpg","language":"Italian","link":"https://en.wikipedia.org/wiki/History_(novel)","pages":600,"title":"History","year":1974},{"author":"Toni Morrison","country":"United States","imageLink":"images/beloved.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Beloved_(novel)","pages":321,"title":"Beloved","year":1987},{"author":"Murasaki Shikibu","country":"Japan","imageLink":"images/the-tale-of-genji.jpg","language":"Japanese","link":"https://en.wikipedia.org/wiki/The_Tale_of_Genji","pages":1360,"title":"The Tale of Genji","year":1006},{"author":"Robert Musil","country":"Austria","imageLink":"images/the-man-without-qualities.jpg","language":"German","link":"https://en.wikipedia.org/wiki/The_Man_Without_Qualities","pages":365,"title":"The Man Without Qualities","year":1931},{"author":"Vladimir Nabokov","country":"Russia/United States","imageLink":"images/lolita.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Lolita","pages":317,"title":"Lolita","year":1955},{"author":"George Orwell","country":"United Kingdom","imageLink":"images/nineteen-eighty-four.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Nineteen_Eighty-Four","pages":272,"title":"Nineteen Eighty-Four","year":1949},{"author":"Ovid","country":"Roman Empire","imageLink":"images/the-metamorphoses-of-ovid.jpg","language":"Classical Latin","link":"https://en.wikipedia.org/wiki/Metamorphoses","pages":576,"title":"Metamorphoses","year":100},{"author":"Fernando Pessoa","country":"Portugal","imageLink":"images/the-book-of-disquiet.jpg","language":"Portuguese","link":"https://en.wikipedia.org/wiki/The_Book_of_Disquiet","pages":272,"title":"The Book of Disquiet","year":1928},{"author":"Edgar Allan Poe","country":"United States","imageLink":"images/tales-and-poems-of-edgar-allan-poe.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Edgar_Allan_Poe_bibliography#Tales","pages":842,"title":"Tales","year":1950},{"author":"Marcel Proust","country":"France","imageLink":"images/a-la-recherche-du-temps-perdu.jpg","language":"French","link":"https://en.wikipedia.org/wiki/In_Search_of_Lost_Time","pages":2408,"title":"In Search of Lost Time","year":1920},{"author":"François Rabelais","country":"France","imageLink":"images/gargantua-and-pantagruel.jpg","language":"French","link":"https://en.wikipedia.org/wiki/Gargantua_and_Pantagruel","pages":623,"title":"Gargantua and Pantagruel","year":1533},{"author":"Juan Rulfo","country":"Mexico","imageLink":"images/pedro-paramo.jpg","language":"Spanish","link":"https://en.wikipedia.org/wiki/Pedro_P%C3%A1ramo","pages":124,"title":"Pedro Páramo","year":1955},{"author":"Rumi","country":"Sultanate of Rum","imageLink":"images/the-masnavi.jpg","language":"Persian","link":"https://en.wikipedia.org/wiki/Masnavi","pages":438,"title":"The Masnavi","year":1236},{"author":"Salman Rushdie","country":"United Kingdom, India","imageLink":"images/midnights-children.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Midnight%27s_Children","pages":536,"title":"Midnight\u0027s Children","year":1981},{"author":"Saadi","country":"Persia, Persian Empire","imageLink":"images/bostan.jpg","language":"Persian","link":"https://en.wikipedia.org/wiki/Bustan_(book)","pages":298,"title":"Bostan","year":1257},{"author":"Tayeb Salih","country":"Sudan","imageLink":"images/season-of-migration-to-the-north.jpg","language":"Arabic","link":"https://en.wikipedia.org/wiki/Season_of_Migration_to_the_North","pages":139,"title":"Season of Migration to the North","year":1966},{"author":"José Saramago","country":"Portugal","imageLink":"images/blindness.jpg","language":"Portuguese","link":"https://en.wikipedia.org/wiki/Blindness_(novel)","pages":352,"title":"Blindness","year":1995},{"author":"William Shakespeare","country":"England","imageLink":"images/hamlet.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Hamlet","pages":432,"title":"Hamlet","year":1603},{"author":"William Shakespeare","country":"England","imageLink":"images/king-lear.jpg","language":"English","link":"https://en.wikipedia.org/wiki/King_Lear","pages":384,"title":"King Lear","year":1608},{"author":"William Shakespeare","country":"England","imageLink":"images/othello.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Othello","pages":314,"title":"Othello","year":1609},{"author":"Sophocles","country":"Greece","imageLink":"images/oedipus-the-king.jpg","language":"Greek","link":"https://en.wikipedia.org/wiki/Oedipus_the_King","pages":88,"title":"Oedipus the King","year":-430},{"author":"Stendhal","country":"France","imageLink":"images/le-rouge-et-le-noir.jpg","language":"French","link":"https://en.wikipedia.org/wiki/The_Red_and_the_Black","pages":576,"title":"The Red and the Black","year":1830},{"author":"Laurence Sterne","country":"England","imageLink":"images/the-life-and-opinions-of-tristram-shandy.jpg","language":"English","link":"https://en.wikipedia.org/wiki/The_Life_and_Opinions_of_Tristram_Shandy,_Gentleman","pages":640,"title":"The Life And Opinions of Tristram Shandy","year":1760},{"author":"Italo Svevo","country":"Italy","imageLink":"images/confessions-of-zeno.jpg","language":"Italian","link":"https://en.wikipedia.org/wiki/Zeno%27s_Conscience","pages":412,"title":"Confessions of Zeno","year":1923},{"author":"Jonathan Swift","country":"Ireland","imageLink":"images/gullivers-travels.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Gulliver%27s_Travels","pages":178,"title":"Gulliver\u0027s Travels","year":1726},{"author":"Leo Tolstoy","country":"Russia","imageLink":"images/war-and-peace.jpg","language":"Russian","link":"https://en.wikipedia.org/wiki/War_and_Peace","pages":1296,"title":"War and Peace","year":1867},{"author":"Leo Tolstoy","country":"Russia","imageLink":"images/anna-karenina.jpg","language":"Russian","link":"https://en.wikipedia.org/wiki/Anna_Karenina","pages":864,"title":"Anna Karenina","year":1877},{"author":"Leo Tolstoy","country":"Russia","imageLink":"images/the-death-of-ivan-ilyich.jpg","language":"Russian","link":"https://en.wikipedia.org/wiki/The_Death_of_Ivan_Ilyich","pages":92,"title":"The Death of Ivan Ilyich","year":1886},{"author":"Mark Twain","country":"United States","imageLink":"images/the-adventures-of-huckleberry-finn.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Adventures_of_Huckleberry_Finn","pages":224,"title":"The Adventures of Huckleberry Finn","year":1884},{"author":"Valmiki","country":"India","imageLink":"images/ramayana.jpg","language":"Sanskrit","link":"https://en.wikipedia.org/wiki/Ramayana","pages":152,"title":"Ramayana","year":-450},{"author":"Virgil","country":"Roman Empire","imageLink":"images/the-aeneid.jpg","language":"Classical Latin","link":"https://en.wikipedia.org/wiki/Aeneid","pages":442,"title":"The Aeneid","year":-23},{"author":"Vyasa","country":"India","imageLink":"images/the-mahab-harata.jpg","language":"Sanskrit","link":"https://en.wikipedia.org/wiki/Mahabharata","pages":276,"title":"Mahabharata","year":-700},{"author":"Walt Whitman","country":"United States","imageLink":"images/leaves-of-grass.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Leaves_of_Grass","pages":152,"title":"Leaves of Grass","year":1855},{"author":"Virginia Woolf","country":"United Kingdom","imageLink":"images/mrs-dalloway.jpg","language":"English","link":"https://en.wikipedia.org/wiki/Mrs_Dalloway","pages":216,"title":"Mrs Dalloway","year":1925},{"author":"Virginia Woolf","country":"United Kingdom","imageLink":"images/to-the-lighthouse.jpg","language":"English","link":"https://en.wikipedia.org/wiki/To_the_Lighthouse","pages":209,"title":"To the Lighthouse","year":1927},{"author":"Marguerite Yourcenar","country":"France/Belgium","imageLink":"images/memoirs-of-hadrian.jpg","language":"French","link":"https://en.wikipedia.org/wiki/Memoirs_of_Hadrian","pages":408,"title":"Memoirs of Hadrian","year":1951}]';`
```

I need to parse this data as JSON so JavaScript can process it.


```


my_big_json = JSON.parse(my_big_json);

for (var i = 0; i &lt; my_big_json.length; i++) {

    console.log(i + 1, " -&gt; ", my_big_json[i]);
}

```

To ensure that the loading process was successful, I'm iterating over the JSON dataset and printing each entry. You should see the following in your console log.

![Console log output][6]

(Ayush Sharma, [CC BY-SA 4.0][7])

#### Building the search index

Now I will build the search index in a variable called `idx` using the `lunr()` function. This step requires three things:

  1. Lunr returns a document reference for every document that matches a search query. And I need to tell Lunr which field in the dataset should be the reference. Usually, this reference is a numeric ID unique to every document. Since the dataset does not contain such a field, I'll use the `link` field as the reference field.
  2. Lunr also requires a list of fields that should be part of the search index. For this example, I want to search on `author`, `title`, and `country`.
  3. Lastly, Lunr requires the dataset: The `my_big_json` variable.



I can now call the `lunr()` function to build the search index `idx`.


```


var idx = lunr(function () {
 
    this.ref('link')
    this.field('author')
    this.field('title')
    this.field('country')

    my_big_json.forEach(function (doc) {
        this.add(doc)
    }, this)
});

```

If there were no errors in your browser's console log, then the index build was successful. Next, I'll take it for a test drive.

### Looking for books in the dataset with Lunr

First, I want to see if there are any documents containing the word `adventures`:


```


results = idx.search("adventures");
console.log('Results: ', results.length);

```

I should see the following in the console log:


```
`Results: 1`
```

Alright. So there is one document that matches the search query `adventures`. But how do I display it?

As I mentioned before, Lunr returns the reference of the matching document. But not the document itself. Meaning if I print `results`, I'll see the following.

![Output from print results][8]

(Ayush Sharma, [CC BY-SA 4.0][7])

Here `results` contains an array of objects with a single element. And that element's `ref` field contains a value. This is because I used the `link` field as the reference. To show the full document, I need to work a bit harder.


```


results = idx.search("adventures");
console.log('Results: ', results.length);

var results_full = results.map(function (item) {
    return my_big_json.filter(function (value, index, arr) {
        return value.link == item.ref;
    })[0];
});
console.log(results_full);

```

In the above code, I'm iterating through the results using the `map()` function. I then find documents in `my_big_json` for all the references in the result set. So `results_full` contains the complete search results.


```
`0: Object { author: "Mark Twain", country: "United States", imageLink: "images/the-adventures-of-huckleberry-finn.jpg", … }`
```

Now, I repeat the search for the keyword `india`. The code is as follows.


```


results = idx.search("india");
console.log('Results: ', results.length);

var results_full = results.map(function (item) {
    return my_big_json.filter(function (value, index, arr) {
        return value.link == item.ref;
    })[0];
});
console.log(results_full);

```

And the results are:


```


Results:  4
0: Object { author: "Kālidāsa", country: "India", imageLink: "images/the-recognition-of-shakuntala.jpg", … }
1: Object { author: "Valmiki", country: "India", imageLink: "images/ramayana.jpg", … }
2: Object { author: "Vyasa", country: "India", imageLink: "images/the-mahab-harata.jpg", … }
3: Object { author: "Salman Rushdie", country: "United Kingdom, India", imageLink: "images/midnights-children.jpg", … }

```

And it's that simple! Adding search for any array of JSON objects only requires five easy steps:

  1. Call `Lunr.js`.
  2. Identify the reference fields and the search fields.
  3. Build the search index by iterating over the dataset.
  4. Call the `search()` method to search the index and return the matching references.
  5. And finally, retrieve the documents for the matching references.



### Prebuilding Lunr.js's search index

You may have noticed that the search index takes some time to build on every page refresh. The time may be imperceptible right now. But it won't be when `lunr.html` is on a remote server. Lunr allows [pre-building the search index][9] to make the search more responsive.

There are two ways of pre-building the index. The first method is to serialize the index after building it. Since I've already created the index in the tutorial, I use this method.


```


var serializedIdx = JSON.stringify(idx);
console.log(serializedIdx);

```

I would then replace `my_big_json` with the serialized string. The index load command would also change.


```
`var my_big_json = lunr.Index.load(JSON.parse(serializedIdx));`
```

The [second method][9] involves calling the above commands in the CLI. This method is great for running in a CI/CD pipeline. I'll talk about this method more later on.

### Lunr.js search tips and tricks

Web search engines like [DuckDuckGo][10] provide a way to prioritize search terms. For example, a `+` sign includes a search term, and a `-` sing excludes it.

Lunr provides similar features to prioritize search terms or search fields. A `+` includes a search term, and a `-` sign excludes it. The `~` symbol allows fuzzy matching. The `^` symbol allows weighting search terms. And the `:` symbol allows search for specific fields.

For example, to find the best books published in England but not by Shakespeare, the Lunr query is:


```
`results = idx.search("country:England -author:Shakespeare");`
```

This gives me two results:


```


0: {author: 'Geoffrey Chaucer', country: 'England', imageLink: 'images/the-canterbury-tales.jpg', language: 'English', link: '<https://en.wikipedia.org/wiki/The\_Canterbury\_Tales>', …}
1: {author: 'Laurence Sterne', country: 'England', imageLink: 'images/the-life-and-opinions-of-tristram-shandy.jpg', language: 'English', link: '<https://en.wikipedia.org/wiki/The\_Life\_and\_Opinions\_of\_Tristram\_Shandy,\_Gentleman>', …}

```

### Lunr in action: findmymastodon.com!

[findmymastodon.com][4] helps users find, well, Mastodon instances. These instances often cater to specific languages, themes, and interests. And so, the website needed a search engine.

I started by first building the dataset using Python. The [dataset][11] contains metadata for thousands of Mastodon instances currently live. I then used [Node to create a serialized Lunr index][12] from the original JSON. This [Lunr index][13] gets then loaded as a static asset. Search executes against this index, and the Mastodon instances, if found, display on the search page. You can browse the [JavaScript source code here][14].

### Conclusion

Lunr can prove to be a useful ally in web development. It's especially great for static websites which don't rely on an active backend. Support for pre-built indices using a CLI is a huge performance bonus. This allows using CI/CD to fetch data from a remote backend and create the index. Meaning the backend no longer needs to remain active to serve search requests.

Client-side search is a new thing for me. I've been a DevOps/cloud guy for a long time, and I'm eager to find out how this can improve security and optimize costs. Web browsers are becoming more sophisticated every day. Letting them handle the heavy-lifting for search might grant performance improvements, improved user experiences, and lower cloud costs.

Thanks for reading this how-to, and I hope it sparked some creative ideas in your head. Happy coding.

* * *

_This article originally appeared on the [author's blog][15] and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/client-side-javascript-search-lunrjs

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/markus-winkler-unsplash.jpg?itok=MNj-Xwo_ (magnifying glass for search on a blue background)
[2]: https://lunrjs.com/
[3]: https://raw.githubusercontent.com/benoitvallon/100-best-books/master/books.json
[4]: https://findmymastodon.com
[5]: https://gitlab.com/ayush-sharma/example-assets/-/blob/main/front-end/js/lunr-tutorial.html
[6]: https://opensource.com/sites/default/files/uploads/console-log.png (Console log output)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/print-results.png (Output from print results)
[9]: https://lunrjs.com/guides/index_prebuilding.html
[10]: https://duckduckgo.com
[11]: https://gitlab.com/ayush-sharma/find-my-mastodon/-/blob/master/data/data-raw.json
[12]: https://gitlab.com/ayush-sharma/find-my-mastodon/-/blob/master/README.md#building-lunr-index
[13]: https://gitlab.com/ayush-sharma/find-my-mastodon/-/blob/master/data/search-index.js
[14]: https://gitlab.com/ayush-sharma/find-my-mastodon/-/blob/master/static/js/script-search.js
[15]: https://ayushsharma.in/2021/11/using-lunr-js-to-create-client-side-website-search-index
