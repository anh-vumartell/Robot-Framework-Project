from robot.api.deco import keyword
import random #a module to generate random number

@keyword(tags=["random"], types={"min": int, "max":int})
def generate_random_number(min, max):
    return random.randint(min,max)
