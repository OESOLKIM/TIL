def awesome(func):
    def wrapper():
        func()
        print("No, you are awesome")
    return wrapper


def ordinary():
    print('I am ordinary')

ordinary()

extra_ordinary = awesome(ordinary)