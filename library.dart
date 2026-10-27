abstract class LibraryItem {
  String _id;
  String _title;
  bool _isBorrowed = false;
  LibraryItem(this._id, this._title);
  String get id => _id;
  String get title => _title;
  bool get isBorrowed => _isBorrowed;

  bool borrowItem() {
    if (_isBorrowed) return false;
    _isBorrowed = true;
    return true;
  }

  bool returnItem() {
    if (!_isBorrowed) return false;
    _isBorrowed = false;
    return true;
  }

  void displayDetails() {
    print(
      'ID: $_id | Title: "$_title" | Status: ${_isBorrowed ? "Borrowed" : "Available"}',
    );
  }
}

class Book extends LibraryItem {
  String author;
  Book(String id, String title, this.author) : super(id, title);
  @override
  void displayDetails() {
    print(
      'ID: $id | Title: "$title" | Status: ${isBorrowed ? "Borrowed" : "Available"} | Type: Book | Author: $author',
    );
  }
}

class Magazine extends LibraryItem {
  int issueNumber;
  Magazine(String id, String title, this.issueNumber) : super(id, title);
  @override
  void displayDetails() {
    print(
      'ID: $id | Title: "$title" | Status: ${isBorrowed ? "Borrowed" : "Available"} | Type: Magazine | Issue: #$issueNumber',
    );
  }
}

class Member {
  String name;
  List<LibraryItem> borrowedItems = [];
  Member(this.name);

  void borrow(LibraryItem item) {
    if (borrowedItems.length >= 3) {
      print('[$name] FAILED: Limit reached (Max 3 items).');
    } else if (item.isBorrowed) {
      print('[$name] FAILED: "${item.title}" is already borrowed.');
    } else {
      item.borrowItem();
      borrowedItems.add(item);
      print('[$name] SUCCESS: Borrowed "${item.title}".');
    }
  }

  void returnItem(LibraryItem item) {
    if (!borrowedItems.contains(item)) {
      print('[$name] FAILED: "${item.title}" was not borrowed by $name.');
    } else {
      item.returnItem();
      borrowedItems.remove(item);
      print('[$name] SUCCESS: Returned "${item.title}".');
    }
  }
}

void main() {
  List<LibraryItem> catalog = [
    Book('B101', 'Clean Code', 'Robert C. Martin'),
    Book('B102', 'The Pragmatic Programmer', 'Andrew Hunt'),
    Magazine('M101', 'Tech Monthly', 42),
    Book('B103', 'Design Patterns', 'Erich Gamma'),
  ];

  print('=== Library Catalog ===');
  for (var item in catalog) {
    item.displayDetails();
  }

  Member member1 = Member('Ahmed');
  Member member2 = Member('Zakaria');

  print('\n=== Testing Borrowing & Limits ===');
  member1.borrow(catalog[0]);
  member1.borrow(catalog[1]);
  member1.borrow(catalog[2]);
  member1.borrow(catalog[3]);

  print('\n=== Testing Invalid Operations ===');
  member2.borrow(catalog[0]);
  member2.returnItem(catalog[0]);

  print('\n=== Testing Return & Re-borrowing ===');
  member1.returnItem(catalog[1]);
  member2.borrow(catalog[1]);
}
