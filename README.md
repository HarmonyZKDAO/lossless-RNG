# Lossless-RNG

This repository contains code for Random Number Generation for Lossless Protocol.

It uses Harmony onchain Verifiable random function.

# HARMONY VRF
Harmony builds on the existing cryptographic primitive of BLS signatures which are currently used for block signing and consensus to create an efficient and secure VRF construction. The BLS-based VRF works as follows. Given a VRF input M, a BLS private key SK is first used to sign on M to produce a signature S=sign(SK, M). Then the signature is hashed with sha256 to produce the VRF random output R=hash(S), and the signature itself becomes the VRF proof P=S. The VRF output R can be verified with the proof P by checking that P is the correct signature from PK on message M and that hash(P)=R. More formally, the BLS-based VRF construction (Keygen, Compute, Verify) can be specified as follows:
Keygen(r) → (PK, SK). The BLS key generation algorithm produces a pair of public key PK and private key SK.
Compute(SK, M): Hash(Sign(SK, M)) → (R, P). The computation of VRF output R is the hashing of the signature signed with the private key SK on message M. The VRF proof P equals the signature from Sign(SK, M).
Verify(PK, M, R, P): SigVerify(PK, P, M)=True & Hash(P)=R. The verification of the VRF works by checking 1) the VRF proof P is the correct signature from public key PK and message M; 2) the VRF output R equals the hash of P.


## USAGE
import or inherit the VRF contract located in /contract/HarmonyVRF.sol
Call the `callVRF` function to generate random number.

## HARDHAT COMMANDS
```shell
npx hardhat help
npx hardhat test
GAS_REPORT=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```
