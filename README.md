

# Poems Encrypt Secret Records 

This project is designed to test record generation on the Aleo platform.

## Setting Up

### Testing Record Generation

To test record generation, use the following command:

```bash
$ Aleo account new
```

You should receive output similar to:

```plaintext
Private Key: APrivateKey...
View Key: AViewKey...
Address: aleo1...
```

### Environment Variables

Before running the subsequent commands, set up the necessary environment variables:

```bash
export PRIVATEKEY="YourPrivateKeyHere"
export VIEWKEY="YourViewKeyHere"
export WALLETADDRESS="YourWalletAddressHere"
export APPNAME=randomnesspoems${WALLETADDRESS:4:6}
export RECORD="YourRecordHere"
```

## Development Workflow

### 1. Initialize the Application

To start a new application:

```bash
leo new $APPNAME
cd $APPNAME
```

### 2. Building the Application

To build the application:

```bash
leo build
```

### 3. Deploy the Application

To deploy the application:

```bash
snarkos developer deploy "${APPNAME}.aleo" \
--private-key "${PRIVATEKEY}" \
... # other flags
```

### 4. Execute the Application

To execute the application:

```bash
snarkos developer execute "${APPNAME}.aleo" "interpretations" \
... # other flags
```

## Notes

- After deploying the application, ensure you get the transaction ID. Use the appropriate snarkos operation to retrieve the record cipher associated with the transaction ID.
- Always update the `$RECORD` in your development directory after each deployment. The latest record must be spent for subsequent executions.

---

This README provides a structured overview of your project and its workflow. Adjustments can be made as needed.