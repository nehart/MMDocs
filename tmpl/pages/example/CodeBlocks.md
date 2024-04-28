Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum pretium lectus varius pharetra. Etiam non efficitur nisi. Sed dignissim convallis nunc, et viverra turpis convallis sit amet. Vestibulum ullamcorper convallis enim a tincidunt. Suspendisse varius nisl ipsum, et blandit sem varius vel. Proin scelerisque dui sit amet metus consequat cursus. Donec a condimentum lectus. Nunc eleifend vulputate suscipit. Vestibulum quis quam sed ligula maximus elementum. Sed porta cursus lacinia. Mauris eget laoreet diam, ut maximus purus. Aenean ullamcorper tortor sed mi varius, sit amet euismod nisl pellentesque. Nulla sit amet porta orci. Nulla ut tristique nisi.

```{ .python title="example.py" linenums="234" hl_lines="1 8-9 13" }
import time

def countdown(time_sec):
    while time_sec:
        mins, secs = divmod(time_sec, 60)
        timeformat = '{:02d}:{:02d}'.format(mins, secs)
        print(timeformat, end='\r')
        time.sleep(1)
        time_sec -= 1

    print("stop")

countdown(5)
```

Nulla sed molestie metus. Sed aliquam tellus id ex pharetra pulvinar. Vivamus ac lacus iaculis, mollis nisi et, tincidunt mi. Aenean condimentum risus vel gravida dictum. Mauris ultricies risus nisl, cursus egestas ante malesuada eget. Nam at urna diam. Nam at pharetra urna. Nulla non eleifend risus. Aenean aliquet mi nibh. Aenean eu ipsum ultricies, volutpat urna scelerisque, vestibulum nisi. Sed sed ipsum sit amet erat lacinia eleifend. Proin a nunc volutpat, iaculis magna id, suscipit eros. Mauris dapibus orci vitae orci gravida scelerisque.

/// admonition |
    type: tip

```{ .python linenums="234" .copy }
num = 1234
reversed_num = 0

while num != 0:
    digit = num % 10
    reversed_num = reversed_num * 10 + digit
    num //= 10

print("Reversed Number: " + str(reversed_num))
```

///

Nulla facilisi. In non bibendum nisi. Duis euismod auctor ullamcorper. Curabitur ut est imperdiet, molestie ligula vitae, porttitor felis. In sed tristique nulla, eu iaculis est. Curabitur tristique erat sapien. Fusce nisl est, malesuada nec venenatis id, hendrerit et mi. Praesent ut diam congue odio pharetra auctor luctus auctor urna. Nulla ac elit lorem. Maecenas felis felis, dapibus et tempus sed, facilisis ac odio. Morbi pretium in risus eu tempor. Mauris laoreet tortor quis ligula convallis, in eleifend neque lobortis. Phasellus dolor metus, tincidunt vel libero imperdiet, euismod congue risus. Nam ut convallis risus, id tincidunt leo. Vivamus a quam metus. Donec non erat eget augue scelerisque ornare.

Nulla ligula magna, ullamcorper ullamcorper mattis at, imperdiet at quam. In faucibus quam in eleifend finibus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque vehicula dui massa. Etiam quis efficitur turpis, eu lobortis magna. Nullam malesuada pretium purus, vel dapibus metus dapibus at. Morbi a nibh at massa scelerisque accumsan efficitur vitae ante. Aenean nulla ante, mollis at cursus eget, egestas vitae odio. Cras nunc purus, condimentum ut lacus pharetra, auctor tempor purus.

/// admonition |
    type: tip

```{ .python linenums="234" }
def split(list_a, chunk_size):

  for i in range(0, len(list_a), chunk_size):
    yield list_a[i:i + chunk_size]

chunk_size = 2
my_list = [1,2,3,4,5,6,7,8,9]
print(list(split(my_list, chunk_size)))
```

///

Nulla id feugiat velit, non gravida metus. In dapibus felis nec metus hendrerit, sed viverra nunc bibendum. Suspendisse maximus consectetur dui vitae maximus. Integer condimentum pellentesque tincidunt. Nulla fringilla aliquam lectus. Ut sed ligula tincidunt, congue lorem a, euismod est. Fusce luctus justo justo, sed cursus libero bibendum non. Ut congue nibh vitae bibendum posuere. Pellentesque maximus lacus non velit mattis, eu euismod orci laoreet.

Nulla facilisi. Donec imperdiet neque quis sem convallis, sed semper lacus mollis. Integer porta mi diam, ut rhoncus erat viverra non. Donec ac eleifend eros. Integer a cursus lacus. Nullam aliquam blandit justo non consequat. Curabitur mi enim, congue ac commodo et, iaculis sed sapien. Vivamus tincidunt eros massa, volutpat placerat ante fermentum id.

Nunc lorem turpis, blandit non scelerisque et, mollis in lectus. Nullam congue mi in arcu lobortis, id pharetra purus aliquam. Fusce ultricies dapibus maximus. Nullam magna massa, ullamcorper in erat sit amet, varius fringilla lacus. Phasellus scelerisque ullamcorper elit, et hendrerit elit sagittis non. Mauris mollis tortor eget pulvinar pretium. Nunc suscipit a diam sit amet commodo.

Pellentesque ut ex iaculis, hendrerit odio tincidunt, scelerisque mauris. Mauris lobortis nisl vel orci auctor, id suscipit odio dignissim. Nulla facilisi. Aenean ac feugiat nunc. Sed dictum, metus et mattis scelerisque, lorem leo efficitur erat, vel ornare ex dolor in ligula. Nunc ut placerat urna, id gravida neque. Maecenas sed lobortis odio, vel pretium risus. Donec finibus bibendum nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam posuere tellus sit amet turpis auctor, faucibus fermentum orci tempor. Vestibulum dictum consequat arcu, vitae ornare urna volutpat at.

Fusce sed elementum quam. Phasellus ut dolor a sapien gravida sagittis sodales a nulla. Mauris quis nunc auctor, tristique quam feugiat, dapibus leo. Phasellus a cursus tellus, eget porttitor nunc. Donec porttitor tellus sed volutpat luctus. Nullam eleifend a lacus porttitor dictum. Donec vel placerat risus, id aliquet ex. Vestibulum in leo quis purus pharetra tincidunt. Vivamus blandit, arcu ac tempus cursus, ex dui consectetur augue, sed lobortis justo metus ut nisl. Suspendisse sed placerat mauris, sit amet varius nulla.

Nullam blandit urna leo. Nam semper arcu lorem, id lobortis mi elementum ac. Donec eget odio ex. Aliquam posuere sollicitudin orci, fringilla luctus orci porta id. Fusce in egestas magna. Vivamus aliquam, purus sed interdum porta, purus justo euismod risus, et congue eros lectus et elit. Aliquam tincidunt nec dolor non dapibus. Aenean non pretium dolor. Duis vitae magna ut mi tincidunt fringilla hendrerit eget dolor. Praesent non sodales ipsum. Fusce dignissim pharetra erat vel auctor. Etiam placerat, erat in auctor molestie, mi quam suscipit enim, ultrices lobortis est nisi quis odio. Phasellus et neque vitae sapien consequat commodo. Nulla facilisi. Maecenas sed sollicitudin massa. Quisque orci mi, fringilla eu mi molestie, porta sodales sapien.

/// admonition |
    type: tip

=== "C"

    ```{ .c }
    #include <stdio.h>

    int main(void) {
    printf("Hello world!\n");
    return 0;
    }
    ```

=== "C++"

    ```{ .c++ }
    #include <iostream>

    int main(void) {
    std::cout << "Hello world!" << std::endl;
    return 0;
    }
    ```

///

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi a nisl sed sapien vulputate molestie. Sed ullamcorper sem sit amet arcu volutpat consectetur. Aenean ut ex arcu. Praesent cursus risus eu ante lobortis convallis. Nunc nec nunc leo. Morbi aliquam risus vitae suscipit volutpat. Vivamus pretium sagittis dapibus. Praesent nec justo ut est gravida scelerisque a vitae lorem. Ut id lorem enim.

Phasellus ac scelerisque ipsum. Curabitur ac diam vel massa maximus sollicitudin id non augue. Phasellus at ligula in nibh commodo ultrices id mollis nunc. Donec commodo tellus vel imperdiet posuere. Vestibulum tincidunt, sem iaculis suscipit egestas, urna felis pretium nisi, sit amet suscipit ipsum augue non arcu. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis dignissim sapien ac eleifend semper. Phasellus iaculis, eros ut viverra varius, ipsum nisl cursus lorem, eu lobortis eros odio non arcu. Aenean ornare, odio nec feugiat dictum, eros orci eleifend dui, eget pulvinar magna tellus sit amet lorem. Quisque vel aliquet elit. Duis quis neque ac turpis tempus sollicitudin. Aenean sapien felis, dignissim rhoncus urna ut, tempus luctus est.

Curabitur vel est euismod, fermentum quam non, rutrum ante. Nulla facilisi. Sed consectetur justo a risus lobortis auctor. Etiam ullamcorper nulla urna, vitae ullamcorper mi malesuada id. Ut sagittis sapien orci. Quisque a commodo odio, tincidunt rutrum augue. Aliquam sem leo, auctor quis felis vitae, venenatis vulputate augue. Nulla ac auctor felis. Etiam eleifend leo augue, sed blandit mauris suscipit id. Curabitur fringilla eros ut varius ultrices. Nullam a nisi sed risus pulvinar pharetra. Quisque nunc orci, bibendum id turpis sed, pharetra vehicula dui. Aliquam id ligula ornare, porta mauris vitae, consequat lorem.

Nulla a vulputate quam. Nam nec enim vitae massa auctor elementum sit amet eget nunc. Vivamus pulvinar, sem eu semper varius, diam dui sagittis ipsum, vitae viverra dui sem in lectus. Ut in turpis vitae lacus vestibulum mollis. Donec elit risus, dictum gravida varius sit amet, accumsan at mauris. Fusce maximus nibh a augue aliquam efficitur. Donec commodo lacus ut neque finibus luctus. Nullam quam dolor, facilisis id ex eget, consequat gravida est. Aliquam bibendum ut mi eu ultrices. Sed iaculis vestibulum velit, vitae placerat arcu molestie vitae.

Sed non ex in metus faucibus placerat. Sed ultrices quam nibh, malesuada imperdiet nisi ultrices quis. Sed porta, tortor ut euismod iaculis, nibh justo eleifend lectus, vitae ullamcorper diam erat vitae tellus. Aenean feugiat, leo quis efficitur rhoncus, eros nisi cursus dolor, sed ornare neque dolor non purus. Aenean et mauris rhoncus purus congue pellentesque eu at nunc. Etiam faucibus euismod sodales. Cras ac dolor vel mauris auctor maximus. Maecenas malesuada lectus vel eleifend vehicula. Duis hendrerit, mi eget aliquet euismod, mi ante luctus nibh, nec sagittis leo justo in tortor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam varius non felis sed sagittis. Integer non sapien cursus, accumsan augue sit amet, commodo nibh. Aliquam erat volutpat. Mauris vel leo rhoncus, lacinia nisi in, congue justo.