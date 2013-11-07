BSImplementation
================

A programmatic supplement for Interface Builder.

View controllers are most often the biggest, most un-reusable parts of a project. Interface Builder solves this problem a bit by abstracting away the user interface's instantiation and configuration. Interface Builder can also be used for connecting data sources, services, etc. but most often it's not used for these purposes. This is most likely due to it's name: Interface Builder. A more appropriate name might have been Implementation Builder. 

There are many developers that prefer not to use Interface Builder and instead programmatically create the resources necessary for a view controller. This is done to avoid the problems that Interface Builder introduces:

1. Caching: XIBs will sometimes fail to transfer/update to the build.
2. Search-ability: Xcode's search functionality does not include results from XIB files. 
3. Lazy Loading: All outlets are loaded at once instead of when necessary.
4. Custom initializers: Custom initializers/properties, (i.e. initWithArgument:andArgument:) are not supported.
5. Souce Control: Merging and tracking changes in XIB files is less than intuitive.

However, the problem with a programmatic approach is that it bloats the code and makes the view controller configured for one implementation. My goal was to try to get the best of both of these approaches. This is what I've come up with.

1. Define a protocol of `ViewControllerResourceProvider` that declares a set of configurable properties.
2. Create an NSObject called `ViewControllerImplementation<ViewControllerResourceProvider>` that provides all the necessary getters to instantiate objects lazily.
3. Create a property on my view controller of `id` called `implementation`.
4. Declare the ViewController as a conformer of the `ViewControllerResourceProvider` protocol and override the synthesis of those properties in the view controller using `@dynamic`.
5. Override the `forwardingTargetForSelector:` method of the view controller so that messages sent to it's properties are forwarded to the `ViewControllerImplementation` instance.
6. Add a custom initializer to the `ViewController` called `initWithImplementationWithName:(NSString *)implementationName` that instantiates and assigns it's implementation using `NSClassFromString`.

Applying this approach, code that might have looked like this:
    
    - (void)viewDidLoad {
        [super viewDidLoad];
        self.publicView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        self.publicView.backgroundColor = [UIColor redColor];
        [self.view addSubview:self.publicView];
        self.navigationButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
        self.navigationButton.titleLabel.text = @"Push";
        self.navigationButton.backgroundColor = [UIColor yellowColor];
        [self.navigationButton addTarget:self action:@selector(performCustomSegue) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.navigationButton];
        // Predicate logic...
        self.fetchedResultsController = [[NSFetchedResultsController alloc] init];
        self.fetchedResultsController.delegate = self;
        // Perform fetch...
        for (id object in self.fetchedResultsController.fetchedObjects) {
           NSLog(@"%@", object);
       }
    }
    
would end up looking more like this:

    - (void)viewDidLoad {
        [super viewDidLoad];
        [self.view addSubview:self.publicView];
        [self.view addSubview:self.navigationButton];
        for (id object in self.fetchedResultsController.fetchedObjects) {
            NSLog(@"%@", object);
        }
    }
    
    - (id)initWithImplementationWithName:(NSString *)implementationName {
        if (self = [super init]) {
            _implementation = [UIViewController implementationWithClassName:implementationName];
            _implementation.implementor = self;
        }
        
        return self;
    }

    @dynamic publicView;
    @dynamic scrollView;
    @dynamic fetchedResultsController;
    @dynamic navigationButton;

    - (id)forwardingTargetForSelector:(SEL)aSelector {
        return self.implementation;
    }
    
If you really wanted to, you could subclass `BSViewController`, which includes the `initWithImplementationWithName:` and `forwardingTargetForSelector:` methods, so that your code was just this:

    @dynamic publicView;
    @dynamic scrollView;
    @dynamic fetchedResultsController;
    @dynamic navigationButton;

    - (void)viewDidLoad {
        [super viewDidLoad];
        [self.view addSubview:self.publicView];
        [self.view addSubview:self.navigationButton];
        for (id object in self.fetchedResultsController.fetchedObjects) {
            NSLog(@"%@", object);
        }
    }
