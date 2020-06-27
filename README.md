# Code-server integration with Conductor as a notebook

Project to integrate code-server for xLinux as a notebook in IBM Spectrum Conductor.

### Using:
Run the build_package.sh script to build the Conductor-Code-Server notebook package.

Then you can add this package (example: code-server-3.4.1.tar.gz) to your Conductor cluster through the "Add" button on "Resources" / "Frameworks" / "Notebook Management" page.

Parameters you have to define:
- Name
- Version (typically the version of code-server, example 3.4.1)
- Prestart command: ./scripts/prestart_nb.sh
- Start command: ./scripts/start_nb.sh
- Stop command: ./scripts/stop_nb.sh
- Job monitor command: ./scripts/jobMonitor.sh

Note: Do not enable SSL for the notebook as currently SSL is not supported.

Then you can add it to an existing Spark Instance Group (you need to stop it then go to the configuration page) or create a new Spark Instance Group with it. Once added the code-server runtime will run with no password.
