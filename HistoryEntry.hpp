#ifndef HISTORYENTRY_HPP
#define HISTORYENTRY_HPP

#include <QObject>

class HistoryEntry : public QObject
{
	Q_OBJECT

	Q_PROPERTY(QString date READ date WRITE setDate NOTIFY dateChanged)
	Q_PROPERTY(QString amount READ amount WRITE setAmount NOTIFY amountChanged)
	Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged)

public:
	explicit HistoryEntry(const QString& date, const QString& amount, const QString& description, QObject *parent = 0);
	~HistoryEntry();

	QString date() const;
	void setDate(const QString& date);

	QString amount() const;
	void setAmount(const QString& amount);

	QString description() const;
	void setDescription(const QString& description);

signals:
	void dateChanged();
	void amountChanged();
	void descriptionChanged();

private:
	struct HistoryEntryPrivate& d;
};

#endif // HISTORYENTRY_HPP
