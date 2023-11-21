class SampleAppPage extends StatefulWidget {
  const SampleAppPage({super.key});

  @override
  State<SampleAppPage> createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  String textToShow = 'I Like Flutter';

  void _updateText() {
    setState(() {
      textToShow = 'Flutter is Awesome!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App'),
      ),
      body: Center(child: Text(textToShow)),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Update Text',
        child: const Icon(Icons.update),
      ),
    );
  }
}

@Composable
fun SampleAppPage() {
    var textToShow by remember { mutableStateOf("I Like Flutter") }

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Text(text = "Sample App")
                }
            )
        },
        content = {
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(16.dp),
                verticalArrangement = Arrangement.Center,
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Text(text = textToShow)
            }
        },
        floatingActionButton = {
            FloatingActionButton(
                onClick = {
                    textToShow = "Flutter is Awesome!"
                },
                content = {
                    Icon(Icons.Default.Update, contentDescription = "Update Text")
                }
            )
        }
    )
}

struct SampleAppPage: View {
    @State private var textToShow = "I Like Flutter"
    
    var body: some View {
        NavigationView {
            VStack {
                Text(textToShow)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    textToShow = "Flutter is Awesome!"
                }) {
                    Label("Update Text", systemImage: "arrow.triangle.2.circlepath.circle")
                }
                .padding()
            }
            .navigationTitle("Sample App")
        }
    }
}
