#include "HistoryEntry.hpp"

struct HistoryEntryPrivate
{
	QString date;
	QString amount;
	QString description;
};

HistoryEntry::HistoryEntry(const QString& date, const QString& amount, const QString& description, QObject *parent)
	: QObject(parent)
	, d(*new HistoryEntryPrivate)
{
	d.date = date;
	d.amount = amount;
	d.description = description;
}

HistoryEntry::~HistoryEntry()
{
	delete &d;
}

QString HistoryEntry::date() const
{
	return d.date;
}

void HistoryEntry::setDate(const QString& date)
{
	if (d.date != date)
	{
		d.date = date;
		emit dateChanged();
	}
}

QString HistoryEntry::amount() const
{
	return d.amount;
}

void HistoryEntry::setAmount(const QString& amount)
{
	if (d.amount != amount)
	{
		d.amount = amount;
		emit amountChanged();
	}
}

QString HistoryEntry::description() const
{
	return d.description;
}

void HistoryEntry::setDescription(const QString& description)
{
	if (d.description != description)
	{
		d.description = description;
		emit descriptionChanged();
	}
}
