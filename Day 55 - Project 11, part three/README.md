 Day 55 - Bookworm, Part Three

🔗 [HWS Day 55](https://www.hackingwithswift.com/100/swiftui/55)

🔗 [Resources] (https://github.com/twostraws/HackingWithSwift)


# 📝 Notes

Covered topics:

- Showing book details
- Sorting fetch requests with NSSortDescriptor
- Deleting from a Core Data fetch request
- Using an alert to pop a NavigationLink programmatically


# Showing book details

- We've created the *book details view* and we've also seen how we can add a sample entity for the `Preview`:

```swift
struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book; I really enjoyed it."

        return NavigationView {
            DetailView(book: book)
        }
    }
}
```

# Sorting fetch requests with NSSortDescriptor

- We can use `NSSortDescriptors` to sort the fetched data:

```swift
@FetchRequest(entity: Book.entity(), sortDescriptors: [
    NSSortDescriptor(keyPath: \Book.title, ascending: true),
    NSSortDescriptor(keyPath: \Book.author, ascending: true)
]) var books: FetchedResults<Book>
```

- However, we should keep in mind that if we add too many of them the performance might take a hit.

# Deleting from a Core Data fetch request

- To delete objects from the database we can call:

```swift
moc.delete(book)
```

- But don't forget to save the context afterwards:

```swift
try? moc.save()
```

# Using an alert to pop a NavigationLink programmatically

- If we need to, we can also manually pop a `View` from the `NavigationLink` by using the same `@Environment(\.presentationMode)` property as in the case of `.sheet`. When calling `.dismiss()` from inside a `NavigationLink` it will pop the `View` instead of dismissing it.
- We can have `Alerts` with multiple buttons like this:

```swift
alert(isPresented: $showingDeleteAlert) {
    Alert(title: Text("Delete book"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete")) {
            self.deleteBook()
        }, secondaryButton: .cancel()
    )
}
```