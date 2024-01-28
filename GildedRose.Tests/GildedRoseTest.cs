namespace GildedRose.Tests;

public class Tests
{
    [Test]
    public void NormalItemBeforeExpireDate()
    {
        GildedRose app = new GildedRose (new Item[] {
            new Item { Name = "foo", SellIn = 10, Quality = 12 }
        });

        app.UpdateQuality();
        Item foo = app.Items[0];

        AssertItem(foo, new() { Name = "foo", SellIn = 9, Quality = 11 });
    }

    private static void AssertItem(Item actual, Item expected)
    {
        Assert.Multiple(() =>
        {
            Assert.That(actual.Name, Is.EqualTo(expected.Name));
            Assert.That(actual.Quality, Is.EqualTo(expected.Quality));
            Assert.That(actual.SellIn, Is.EqualTo(expected.SellIn));
        });
    }
}
