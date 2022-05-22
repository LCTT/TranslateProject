[#]: subject: "Organize your Magic: The Gathering decks with Magic Assistant"
[#]: via: "https://opensource.com/article/21/9/magic-the-gathering-assistant"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Organize your Magic: The Gathering decks with Magic Assistant
======
The open source application Magic Assistant makes managing your Magic
collection easy.
![Holding a Magic the Gathering deckmaster card][1]

The world's first trading card game was _Magic: The Gathering,_ first published in 1993.

It remains popular today because of its great flexibility. With more than 25,000 unique cards published over nearly three decades, there are enough cards for players to build hundreds of different decks for surprisingly unique gameplay experiences.

Along with this flexibility, however, there comes a cost: many _Magic: The Gathering_ players collect lots of cards so they can construct lots of different decks, which in turn lets them focus on different win conditions and try out different strategies.

It can be quite a job to keep track of 1,000 cards when you only need 60 to 100 for a deck, but the open source application Magic Assistant makes managing your _Magic_ collection easy.

### Installing Magic Assistant

[Magic Assistant][2] is a Java application, so it's cross-platform. Regardless of whether you're on the open source operating system [Linux,][3] macOS, or Windows, you can download Magic Assistant, double-click on its launcher icon, and use it to manage your cards.

After the application first launches, there are sure to be updates to the card database available. Multiple new _Magic_ sets are released each year, so accept the offer to update and go grab a cup of coffee while new cards are added.

### Importing cards

To catalog your cards with Magic Assistant, either you can rummage through the card database manually to add cards to your local collection, or you can import an existing list. The simplest format for a list of _Magic_ cards is a text file containing the number of copies you own and the name of a card on a line by itself:


```
2x Mimic 1x Mordenkainen's Polymorph 2x Ray of Frost 4x Sol Ring
```

However, the application supports many formats, including a CSV from _Magic: The Gathering Online,_ TCGPlayer table, MTG Studio, Apprentice, DeckBox, and more.

To import your cards, select the Import option from the File menu.

![Sample entry field for importing cards into a deck or collection][4]

Importing cards (Seth Kenlon, [CC BY-SA 4.0][5])

Importing cards adds them to the default collection database (called **main**). This database represents the entirety of your collection. You can then use cards from your collection to build decks and cubes. There's no limit on how many collections you can have, so you can organize your cards in whatever way you prefer.

### Browsing your collection

A collection is organized by its metadata by default. That means you can browse your collection by any number of attributes, including mana cost, card type, color, keyword abilities, and format legality. All of these options are available as tabs at the bottom of the collection interface.

![A view of sorting tabs with several card categories][6]

Interface tabs (Seth Kenlon, [CC BY-SA 4.0][5])

### Building a deck or cube

One way to get better at _Magic: The Gathering_—and get a better feel for how you like to experience the game—is to build decks. On the one hand, it's great to hold physical cards, but, on the other hand, it can be a lot of work to sort through hundreds of cards kept in several different boxes or binders. With Magic Assistant, it's easy to sort through your cards based on whatever attribute you need, so building decks with it is a pleasure.

To build a new deck (Magic Assistant has no concept of a cube, but functionally a cube is arguably no different than a deck), right-click on the Deck category in the Card Navigator panel, then select New to create a new deck.

There are two kinds of decks you can build. You can build a virtual deck, which is purely theorycrafting, with no implication that the deck exists physically. When you create a virtual deck, you can take a card you own only one actual copy of and use it in several decks. You could not build the decks in real life, obviously, because you would be overusing some number of cards, but as a deck idea or recipe, it works well.

Alternately, you can build a "real" deck, which affects your collection the same way a physical deck does. If you put three copies of Sol Ring into a deck, then your collection shows that you have three fewer copies of Sol Ring available.

Choose what kind of deck you're building, and give your deck a name for your own reference in the New window.

![Sample entry field for creating a new deck, with name and parent container][7]

Deckbuilding tool (Seth Kenlon, [CC BY-SA 4.0][5])

To add cards to your a deck, locate the card in your collection, right-click on it, and select Move to or Copy to, followed by the deck you want it to appear in. A virtual deck never lets you move cards to it. Instead, it prompts you to copy the card, because a virtual card never removes a card from your collection.

![Using Copy to to add a card to a specific deck][8]

Adding a card to a deck (Seth Kenlon, [CC BY-SA 4.0][5])

When you have multiple copies of a card and copy that card into a deck, Magic Assistant adds all copies. To decrease or increase the number of copies of a card in a deck, right-click on the card in your deck and choose Decrease count or Increase count.

### Deck reports

After you've built a deck, you can view reports detailing the statistics for the cards you've assembled. You can get charts to view card types, creature types, mana curve, color distribution, and more.

![A pie chart showing the different types of cards, and a chart with greater detail][9]

Charts and graphs (Seth Kenlon, [CC BY-SA 4.0][5])

### Open source tools for everything

There's an open source application for nearly everything, so it's no surprise that there's a robust card collection manager like Magic Assistant to help _Magic: The Gathering_ players. If you play the original trading card game, try this one out. It can help you keep track of which cards you have available for building decks. And just as important, it may encourage you to build more decks more often, because it's so easy to do when all the cards are at your fingertips.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/magic-the-gathering-assistant

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wayne-low-unsplash.jpg?itok=eqvfc71L (Holding a Magic the Gathering deckmaster card)
[2]: https://sourceforge.net/projects/mtgbrowser/
[3]: https://opensource.com/resources/linux
[4]: https://opensource.com/sites/default/files/mtgassistant-import.jpeg (Importing cards into a deck or collection)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/mtgassistant-tab.jpeg (Interface tabs)
[7]: https://opensource.com/sites/default/files/mtgassistant-deck_0.jpeg (Deckbuilding tool)
[8]: https://opensource.com/sites/default/files/mtgassistant-add_0.jpeg (Using Copy to to add a card to a specific deck)
[9]: https://opensource.com/sites/default/files/mtgassistant-chart.jpeg (Charts and graphs)
