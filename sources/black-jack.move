module BlackJack::BlackJack {
    use std::vector::{pop_back, push_back, borrow, remove, length, empty};
    use std::debug::print;
    // use std::signer::Self;
    use aptos_std::string_utils::debug_string;



    struct Deck has drop, key{
        deck: vector<u8>,
        cut_card: u8, // Posicion de la carta de corte (entre 26 y 40 recomendado)
    }

    struct Hand has drop, key {
        hand: vector<u8>,
        value: u8,
    }

    fun shuffle_and_cut_deck(): Deck {

        let sortedDeck = vector<u8>[
            1,2,3,4,5,6,7,8,9,10,10,10,10,
            1,2,3,4,5,6,7,8,9,10,10,10,10,
            1,2,3,4,5,6,7,8,9,10,10,10,10,
            1,2,3,4,5,6,7,8,9,10,10,10,10,
        ];
        let unsortedDeck = empty<u8>();
        for (i in 0..52) {
            let currentSize = length(& sortedDeck) ;
            let index = aptos_framework::randomness::u64_range(0, currentSize);
            let selectedCard = remove(&mut sortedDeck, index);
            push_back(&mut unsortedDeck, selectedCard);
        };

        let cut_card = aptos_framework::randomness::u8_range(0, 13) % 13 + 26; // colocamos el naipe de corte entre la posicion 26 y la 39
        Deck {deck: unsortedDeck, cut_card}
    }

    public entry fun iniciarPartida(cuenta: &signer) {
        let mazo = shuffle_and_cut_deck();
        move_to(cuenta, mazo)
    }

    public fun repartir(mazo: &mut Deck): (Hand, Hand){
        let cardsPlayer = empty<u8>();
        let cardsCrupier = empty<u8>();
        push_back(&mut cardsPlayer, pop_back(&mut mazo.deck));
        push_back(&mut cardsCrupier, pop_back(&mut mazo.deck));
        push_back(&mut cardsPlayer, pop_back(&mut mazo.deck));
        push_back(&mut cardsCrupier, pop_back(&mut mazo.deck));
        let valuePlayer = *borrow<u8>(&cardsPlayer, 0) + *borrow<u8>(&cardsPlayer, 1);
        let valueCrupier = *borrow<u8>(&cardsCrupier, 0) + *borrow<u8>(&cardsCrupier, 1);
        let handPlayer: Hand = Hand {hand: cardsPlayer, value: valuePlayer};
        let handCrupier = Hand {hand: cardsCrupier, value: valueCrupier};
        (handPlayer, handCrupier)
    }

    // public fun getHand(): vector<Card> {
    //     let array = vector::empty<Card>()

    // }

    #[test]
    fun shuffle_and_cut_deck_test () {
        let mazo: Deck = shuffle_and_cut_deck();
        
    }
 

}