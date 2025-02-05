
# Aptos BlackJack

## Overview

Aptos BlackJack is a decentralized card game built on the Aptos blockchain using the Move programming language. This project allows users to play the classic BlackJack game in a secure and transparent manner.

## Features

-   **BlackJack Gameplay**: Play the traditional BlackJack game on-chain.
    
-   **Decentralized Logic**: Game logic is handled through smart contracts.
    
-   **Fair & Transparent**: Game outcomes are provably fair and immutable.
    
-   **Token Betting**: Players can place bets using Aptos-based tokens.
    
-   **Multiplayer Support**: Compete against other players in real-time.
    

## Requirements

-   [Aptos CLI](https://aptos.dev/cli-tools/aptos-cli/)
    
-   Move language knowledge
    
-   Rust (for Move compiler)
    
-   Aptos testnet or local network
    

## Installation

1.  Clone the repository:
    
    ```
    git clone https://github.com/yourusername/aptos-blackjack.git
    cd aptos-blackjack
    ```
    
2.  Install dependencies:
    
    ```
    aptos init
    ```
    
3.  Compile the Move modules:
    
    ```
    aptos move compile
    ```
    
4.  Deploy to the Aptos blockchain:
    
    ```
    aptos move publish --profile default
    ```
    

## Usage

-   **Start a New Game**:
    
    ```
    aptos move run --function-id default::blackjack::start_game --args <bet_amount>
    ```
    
-   **Hit (Draw a Card)**:
    
    ```
    aptos move run --function-id default::blackjack::hit --args <game_id>
    ```
    
-   **Stand (End Turn)**:
    
    ```
    aptos move run --function-id default::blackjack::stand --args <game_id>
    ```
    
-   **Check Game Result**:
    
    ```
    aptos move run --function-id default::blackjack::get_result --args <game_id>
    ```
    

## License

This project is open-source and available under the MIT License.
