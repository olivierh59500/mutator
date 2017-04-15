
/***************************************************Project Mutator****************************************************/
//-*-c++-*-
/*first line intentionally left blank.*/
/*the header for mutator's code breaker.*/
/*Copyright (C) 2017 Farzad Sadeghi

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.*/
/*code structure inspired by Eli Bendersky's tutorial on Rewriters.*/
/**********************************************************************************************************************/
/*inclusion guard*/
#ifndef BRUISER_H
#define BRUISER_H
/**********************************************************************************************************************/
/*included modules*/
/*project headers*/
/*standard library headers*/
#include <string>
#include <fstream>
/*clang headers*/
#include "clang/AST/ASTContext.h"
#include "clang/AST/Expr.h"
#include "clang/AST/Type.h"
#include "clang/AST/ASTTypeTraits.h"
/*llvm headers*/

/**********************************************************************************************************************/
/*using*/
using namespace llvm;
using namespace clang;
/**********************************************************************************************************************/
namespace bruiser
{
/**********************************************************************************************************************/
/**
 * @brief This class hanhles the logging for bruiser.
 */
class BruiserReport
{
  public:
    BruiserReport ();

    ~BruiserReport();

    bool PrintToLog(std::string __in_arg);

  private:
    std::ofstream BruiserLog;
};
/**********************************************************************************************************************/
/**
 * @brief looks through types.
 */
class TypeInfo
{
  public:
    explicit TypeInfo(const clang::ast_type_traits::DynTypedNode* __dtn);

    ~TypeInfo();

    const clang::Type* getTypeInfo(clang::ASTContext* __astc);

  private:
    const clang::ast_type_traits::DynTypedNode* DTN;
};
/**********************************************************************************************************************/
/**********************************************************************************************************************/
} // end of namespace bruiser
#endif
/*last line intentionally left balnk.*/
