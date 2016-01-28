import logging


logger = logging.getLogger('simple')
logging.basicConfig(filename="simple.log", format="%(asctime)s - %(name)s - %(levelname)s - %(message)s", level=logging.DEBUG)



logger.error("  ========")
logger.debug("Debug message.")
logger.info("Info message.")
logger.warning("Warning message.")
logger.error("Error message.")
logger.critical("Critical message.")
