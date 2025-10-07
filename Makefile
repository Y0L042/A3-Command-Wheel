generate_wheel:
	cd CommandWheelPy && uv run command_wheel.py

generate_ui:
	cd CommandWheelPy && uv run generate_ui.py

generate_commands:
	cd CommandWheelPy && uv run generate_commands.py

generate_preinit:
	cd CommandWheelPy && uv run generate_preinit.py

generate_all:
	cd CommandWheelPy && uv run generate_all.py

build:
	cd CommandWheelPy && uv run build.py

generate_all: generate_commands generate_preinit generate_ui

generate_and_build: generate_all build
