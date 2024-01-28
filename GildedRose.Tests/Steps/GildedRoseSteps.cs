using TechTalk.SpecFlow;

namespace GildedRose.Tests.Steps;

[Binding]
public class GildedRoseSteps
{
    private GildedRose app;
    private int originalSellIn;
    private int originalQuality;

    private void InitItem(string name, int sellIn, int quality)
    {
        Item[] items = new Item[] { new Item { Name = name, SellIn = sellIn, Quality = quality } };
        app = new GildedRose(items);
        originalSellIn = sellIn;
        originalQuality = quality;
    }

    [Given(@"an? (.+) with quality (\d+) to be sold by (\d+) days")]
    public void GivenItemBeforeSellBy(string name, int quality, int sellIn)
    {
        InitItem(name, sellIn, quality);
    }

    [Given(@"an? (.+) with quality (\d+) overdue by (\d+) days")]
    public void GivenItemOverdue(string name, int quality, int overdue)
    {
        InitItem(name, -overdue, quality);
    }

    [When(@"a day passes")]
    public void WhenDayPasses()
    {
        app.UpdateQuality();
    }

    [Then(@"the quality should be decreased by (\d+)")]
    public void ThenQualityShouldBeDecreasedBy(int decrease)
    {
        Assert.That(app.Items[0].Quality, Is.EqualTo(originalQuality - decrease));
    }

    [Then(@"the quality should be increased by (\d+)")]
    public void ThenQualityShouldBeIncreasedBy(int increase)
    {
        Assert.That(app.Items[0].Quality, Is.EqualTo(originalQuality + increase));
    }

    [Then(@"the quality should be (\d+)")]
    public void ThenQualityShouldBe(int quality)
    {
        Assert.That(app.Items[0].Quality, Is.EqualTo(quality));
    }

    [Then(@"the sell-by should be decreased by (\d+)")]
    public void ThenSellByShouldBeDecreasedBy(int decrease)
    {
        Assert.That(app.Items[0].SellIn, Is.EqualTo(originalSellIn - decrease));
    }
}
