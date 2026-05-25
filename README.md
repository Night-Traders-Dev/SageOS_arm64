# SageOS_arm64

This is the **SageOS_arm64** port of SageOS.

## Repository Structure

- **main**: Contains the architecture-agnostic core components shared across all SageOS platforms.
- **Hardware Branches**: Specific hardware implementations and drivers live in dedicated branches.

### Target Branches
- **[RPi4](https://github.com/Night-Traders-Dev/SageOS_arm64/tree/RPi4)**: Raspberry Pi 4 Model B (Experimental boot support).

## Booting on RPi4 in QEMU

The ARM64 port supports booting on the Raspberry Pi 4 (QEMU `raspi4b` machine).

To build and run:
1.  Use the `os.boot.build` module in SageLang to generate the kernel.
2.  Link with the provided PL011 UART driver and multi-core parking stub.
3.  Load the kernel at `0x80000`.

Example QEMU command:
```bash
qemu-system-aarch64 -machine raspi4b -cpu cortex-a72 -m 1G -display none -serial stdio -kernel kernel.elf
```

See the main [SageOS README](https://github.com/Night-Traders-Dev/SageOS) for detailed build instructions.
