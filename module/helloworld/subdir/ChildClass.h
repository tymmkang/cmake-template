#ifndef CHILD_CLASS_H
#define CHILD_CLASS_H

#include "../ParentClass.h"

class ChildClass : public ParentClass
{
public:

	ChildClass();

	~ChildClass();

	virtual void Print() override;

};

#endif
