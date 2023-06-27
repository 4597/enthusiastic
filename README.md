# enthusiastic.aleo

## name
Component for click competition game

## Summary
This component implements the business logic of Click Competition Game, so that it is easy for a traditionl PC or a mobile device based Click Competition game to transform to a Dapp by shortening the development cycle. 


## Application Values
1. Player use the address of Aleo wallet as the unique Digital Identity.

2. This component utilizes the features of zk-SNARKs. Participants can only see the scores and Aleo wallet address of top fastest players but not their personal info.


## How to Build

To compile this Aleo program, run:
```bash
aleo build
```

## How to Run
```bash
leo run account 'address' 'sign_address'
```
Enter the user's wallet address and game address, add the account to the game, and return the token object containing the user's address

```bash
leo run add_sign 'token'
```
Enter the token object, increase the number of clicks, return the token object with the number of clicks, and repeatedly call it when repeatedly clicked

```bash
leo run finish 'token'
```
End the game and return to the user with the highest click value and click count



## Parameter Description
```bash
Token => {
    owner: address,
    gates: u64,
    sign_num: u64
}
```
`owner: address,` User wallet address

`gates: u64,` Gas fees

`sign_num: u64,` Number of clicks

