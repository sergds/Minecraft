all:
	@echo Building engine...
	@cythonize engine.py -b
	@rm engine.c
	@rm -rf build
	@echo Building launcher..
	@cython launcher.py --embed
	@gcc launcher.c -o launcher `python-config --includes --ldflags`
	@rm launcher.c
	@mkdir stage_pycraft
	@mv launcher stage_pycraft
	@mv engine.so stage_pycraft
	@cp texture.png stage_pycraft
