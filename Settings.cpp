#include <QSettings>
#include "Settings.hpp"

struct SettingsPrivate
{
	QString	password;
	int		refreshInterval = 0;
};

Settings::Settings(QObject *parent)
	: QObject(parent)
	, settings(*new QSettings("Ecik", "ING Bank Online", this))
	, d(*new SettingsPrivate)
{
}

Settings::~Settings()
{
	delete &d;
}

QString Settings::login() const
{
	return settings.value("login", "").toString();
}

QString Settings::password() const
{
	return d.password;
}

void Settings::setPassword(const QString& password)
{
	if (d.password != password)
	{
		d.password = password;
		emit passwordChanged();
	}
}

QString Settings::account() const
{
	return settings.value("account", "").toString();
}

void Settings::setAccount(const QString& account)
{
	if (settings.value("account").toString() != account)
	{
		settings.setValue("account", account);
		emit accountChanged();
	}
}

void Settings::setLogin(const QString& login)
{
	if (settings.value("login", "").toString() != login)
	{
		settings.setValue("login", login);
		emit loginChanged();
	}
}

int Settings::refreshInterval() const
{
	return d.refreshInterval;
}

void Settings::setRefreshInterval(int interval)
{
	if (d.refreshInterval != interval)
	{
		d.refreshInterval = interval;
		emit refreshIntervalChanged();
	}
}
