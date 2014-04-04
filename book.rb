require 'scanf'
require 'pp'

class Book
    def initialize(title, author, bookID, available)
        @title = title
        @author = author
        @bookID = bookID
        @available = available
    end

    attr_reader :title, :author, :bookID, :available
end

class BookList
    def sortBook(bottom, top, books)
        lower = upper = div = 0
        temp = nil
        
        if bottom >= top
            return
        end

        div = books[bottom].bookID
        lower = bottom
        upper = top

        while lower < upper

            while books[lower].bookID < div
                lower += 1
            end

            while books[upper].bookID > div
                upper -= 1
            end

            if lower < upper
                temp = books[lower]
                books[lower] = books[upper]
                books[upper] = temp
            end
        end

        sortBook(bottom, upper, books)
        sortBook(upper + 1, top, books)
    end

    def searchBook(books, key)
        left = mid = right = 0

        right = books.length - 1

        while left < right
            mid = (left + right) / 2

            if books[mid].bookID < key
                left = mid + 1
            else
                right = mid
            end
        end

        if books[left].bookID == key
            return left
        end

        return -1
    end
end

if __FILE__ == $0
    key = position = 0
    bookArray = []
    bookList = nil

    bookList = BookList.new()

    bookArray.push(Book.new("book0", "author0", 1000, true))
    bookArray.push(Book.new("book1", "author1", 746, false))
    bookArray.push(Book.new("book2", "author2", 25, true))
    bookArray.push(Book.new("book3", "author3", 488, false))
    bookArray.push(Book.new("book4", "author4", 187, true))

    bookList.sortBook(0, bookArray.length - 1, bookArray)

    while true
        puts("検索")

        key = scanf("%u")

        position = bookList.searchBook(bookArray, key[0])

        for i in 0..bookArray.length - 1
            puts("--- " + bookArray[i].bookID.to_s)
        end

        if position != -1
            puts("タイトル：" + bookArray[position].title)
            puts("著者：" + bookArray[position].author)
            puts("管理番号：" + bookArray[position].bookID.to_s)
            puts("貸し出し状況：" + bookArray[position].available.to_s)

        else
            puts("なし")
        end
    end
end

